--------------------------------------------------------------------------------
-- Menubar configuration.
--------------------------------------------------------------------------------

local gears = require('gears')
local menubar = require('menubar')
local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local vicious = require('vicious')

menubar.utils.terminal = terminal -- Set the terminal for applications that require it

-- Keyboard map indicator and switcher 
-- mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

-- Function to set the wallpaper (i.e. for each screen).
local function set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
		layout   = {
			layout  = wibox.layout.fixed.horizontal
		},
		widget_template = {
			{
				{
					layout = wibox.layout.fixed.vertical,
					{
						{
							id = 'text_role',
							widget = wibox.widget.textbox
						},
						top = 11,
						left = 20,
						right = 16,
						bottom = 6,
						widget = wibox.container.margin
					},
					{
						{
							top = 4,
							widget = wibox.container.margin
						},
						id = 'underline',
						bg = '#ffffff',
						shape = gears.shape.rectangle,
						widget = wibox.container.background
					},
				},
				left = 1,
				right = 1,
				widget = wibox.container.margin
			},
			id = 'background_role',
			widget = wibox.container.background,
			shape = gears.shape.rectangle,
			create_callback = function(self, c3, index, objects)
				local focused = false
				for _, x in pairs(awful.screen.focused().selected_tags) do
					if x.index == index then
						focused = true
						break
					end
				end
				if focused then
					self:get_children_by_id("underline")[1].bg = beautiful.primary
				else 
					self:get_children_by_id("underline")[1].bg = beautiful.background
				end
			end,
			update_callback = function(self, c3, index, objects)
				local focused = false
				for _, x in pairs(awful.screen.focused().selected_tags) do
					if x.index == index then
						focused = true
						break
					end
				end
				if focused then
					self:get_children_by_id("underline")[1].bg = beautiful.primary
				else 
					self:get_children_by_id("underline")[1].bg = beautiful.background
				end
			end
		},
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.focused,
        buttons = tasklist_buttons
    }

    -- Create a textclock widget
    mytextclock = wibox.widget.textclock()

	tbox_separator = wibox.widget.textbox(" | ")


	-- Battery percent widget
	-- https://github.com/deficient/battery-widget
	-- local battery_widget = require("battery-widget")
	-- local battery = battery_widget {
	-- 	battery_prefix = '<span color="#F0C674">BAT </span>',
	-- 	percent_colors = {
	-- 		{ 25, "#A54242" },
	-- 		{ 999 ,'#C5C8C6' },
	-- 	}
	-- }

	local bat_widget = wibox.widget.textbox()
	vicious.register(bat_widget, vicious.widgets.bat,
		function (widget, args)
			if args[1] == "↯" then
				-- Full
				return "FULL"
			elseif args[1] == "-" then
				-- Discharging
				return ("BAT %02d%%"):format(args[2])
			elseif args[1] == "⌁" then
				return "UNKNOWN" -- unknown
			elseif args[1] == "↯" then
				return "CHARGED" -- charged
			elseif args[1] == "+" then
				return "CHARGING" -- charging
			else
				return "ERROR!"
			end
		end,
		2, "BAT0")

	local datewidget = wibox.widget.textbox()
	vicious.register(datewidget, vicious.widgets.date, "%b %d %R")

	local cpu_widget = wibox.widget.textbox()
	vicious.register(cpu_widget, vicious.widgets.cpu, "<span color='#F0C674'>CPU</span> <span color='#C5C8C6'>$1%</span>", 2)

	local ram_widget = wibox.widget.textbox()
	vicious.cache(vicious.widgets.mem)
	vicious.register(ram_widget, vicious.widgets.mem, "<span color='#F0C674'>RAM</span> <span color='#C5C8C6'>$1%</span>", 13)

	local root_fs_widget = wibox.widget.textbox()
	vicious.register(root_fs_widget, vicious.widgets.fs, "<span color='#F0C674'>/</span> <span color='#C5C8C6'>${/ used_p}%</span>", 13)

	local wifi_widget = wibox.widget.textbox()
	vicious.register(wifi_widget, vicious.widgets.net, "<span color='#F0C674'>WLAN</span> <span color='#C5C8C6'>${wlp0s20f3 down_mb} MB/s ${wlp0s20f3 up_mb} MB/s</span>", 2)

	local volume_widget = wibox.widget.textbox()
	vicious.register(volume_widget, vicious.widgets.volume, "<span color='#F0C674'>VOL</span> <span color='#C5C8C6'>$1%</span>", 2, {"Master", "-c", "0"})

batwidget = wibox.widget.progressbar()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 50 })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            -- mylauncher,
            s.mytaglist,
            s.mypromptbox,
			tbox_separator
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
			datewidget,
			tbox_separator,
			bat_widget,
			tbox_separator,
			battery,
			tbox_separator,
			cpu_widget,
			tbox_separator,
			ram_widget,
			tbox_separator,
			root_fs_widget,
			tbox_separator,
			wifi_widget,
			tbox_separator,
			volume_widget,
			tbox_separator,
            wibox.widget.systray(),
			tbox_separator,
            mytextclock,
			tbox_separator,
            s.mylayoutbox,
        },
    }
end)
