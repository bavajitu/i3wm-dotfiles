#!/bin/sh

chosen=$(nmcli -t -f ssid dev wifi | sed '/^$/d' | sort -u | rofi -dmenu -p "WiFi")

[ -z "$chosen" ] && exit

nmcli dev wifi connect "$chosen"
