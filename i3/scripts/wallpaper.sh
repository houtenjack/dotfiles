#!/bin/bash

folder=("~/.config/i3/wallpapers/ready")
command=$"* * * * * DISPLAY=:0 feh --bg-center --randomize $folder 2>> /home/ixi/debug.log\n"
feh --bg-center --randomize $folder

crontab -l > cron > /dev/null 2>&1
if grep -q feh "./cron"; then
	exit 0
fi

echo -e "$command" >> cron
crontab cron
rm cron

