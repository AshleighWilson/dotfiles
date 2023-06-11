--------------------------------------------------------------------------------
-- AwesomeWM Configuration
-- by Ashleigh Wilson
--------------------------------------------------------------------------------

-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")


--------------------------------------------------------------------------------
-- Libraries
--------------------------------------------------------------------------------

-- Standard awesome library
gears = require("gears")
awful = require("awful")
require("awful.autofocus")

-- Widget and layout library
wibox = require("wibox")

-- Theme handling library
beautiful = require("beautiful")

-- Notification library
naughty = require("naughty")
menubar = require("menubar")
hotkeys_popup = require("awful.hotkeys_popup")

-- TODO: Remove this to relevant section
awful.screen.set_auto_dpi_enabled(true)


--------------------------------------------------------------------------------
-- Error handling
--------------------------------------------------------------------------------

-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end


--------------------------------------------------------------------------------
-- General configuration
--------------------------------------------------------------------------------

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- Automatically load apps on AwesomeWM startup.
-- TODO: awful.spawn.with_shell("~/.config/awesome/autostart.zsh")

-- Set theme
-- beautiful.init("~/.config/awesome/themes/default/theme.lua")
beautiful.init(gears.filesystem.get_configuration_dir() .. "themes/default/theme.lua")

-- Set the correct border if window is in focus or not.
client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- Default applications
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
modkey = "Mod4"
shiftkey = "Shift"


--------------------------------------------------------------------------------
-- Layout configuration
--------------------------------------------------------------------------------

awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

--------------------------------------------------------------------------------
-- Menu Configuration
--------------------------------------------------------------------------------

myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

--------------------------------------------------------------------------------
-- External configuration files
--------------------------------------------------------------------------------
require("menu")
require("menubar-config")
require("bindings")
require("client")

-- Gaps
beautiful.useless_gap = 5

-- Autostart
awful.spawn.with_shell("feh --auto-reload --no-fehbg --bg-fill .config/wallpapers/fox-forest.jpg")
awful.spawn.with_shell("picom")
awful.spawn.with_shell("nextcloud --background")
awful.spawn.with_shell("thunar --daemon")
awful.spawn.with_shell("plank")
awful.spawn.with_shell("xfce4-power-manager")
awful.spawn.with_shell("gnome-keyring-daemon")

-- TODO: KeepassXC
-- TODO: bluetooth
-- TODO: Network manager

