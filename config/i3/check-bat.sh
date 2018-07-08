#!/bin/bash
BATTINFO=`acpi -b`
if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` < 00:15:00 ]] ; then
    /usr/bin/notify-send "low battery" "$BATTINFO"
fi

if [[ `echo $BATTINFO | awk -F, "/Discharging/ {if ((int($2) < 30) && int($2) > 15) print}"` ]]; then
	 /usr/bin/notify-send -a "Battery status" -u normal -t 3000 "{}\nBattery low!" | paplay ~/Music/beep_batteray/inturder_alert.ogg
fi

if [[ `echo $BATTINFO | grep Full` && `echo $BATTINFO | cut -f 4 -d " "` == 100% ]]; then
	 /usr/bin/notify-send "Cabut Woy" "$BATTINFO"
fi
