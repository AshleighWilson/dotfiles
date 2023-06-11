--------------------------------------------------------------------------------
-- Menu configuration
--------------------------------------------------------------------------------

local awful = require("awful")
local beautiful = require("beautiful")

-- Create a launcher widget and a main menu
myawesomemenu = {
	{ "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
	-- { "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{ "quit", function() awesome.quit() end },
}

-- Build the Main Menu.
mymainmenu = awful.menu({
	items = {
		{ "awesome", myawesomemenu },
        { "open terminal", terminal }
    }
})

-- Create the menu launcher.
mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })
