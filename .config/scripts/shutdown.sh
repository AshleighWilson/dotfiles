#!/usr/bin/env bash

OPTIONS=(
	lock
	suspend
	hibernate
	logout
	reboot
	shutdown
)

choice=$(printf "%s\n" "${OPTIONS[@]}" | rofi -dmenu -i -p "shutdown " -theme-str 'entry { enabled: false;}')

if [ "$choice" == "lock" ]; then
	betterlockscreen -l
elif [ "$choice" == "suspend" ]; then
	systemctl suspend
elif [ "$choice" == "hibernate" ]; then
	systemctl hibernate
elif [ "$choice" == "logout" ]; then
	awesome-client 'awesome.quit()'
elif [ "$choice" == "reboot" ]; then
	systemctl reboot
elif [ "$choice" == "shutdown" ]; then
	systemctl poweroff
else
	echo "Exiting.."
fi
