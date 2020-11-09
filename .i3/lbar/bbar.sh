#!/bin/bash
# ___.  __________
# \_ |__\______   \_____ _______
#  | __ \|    |  _/\__  \\_  __ \
#  | \_\ \    |   \ / __ \|  | \/
#  |___  /______  /(____  /__|
#      \/       \/      \/
# File              : bbar.sh
# Author            : Sam Uel <samuelfreitas@linuxmail.org>
# Date              : 07 dec 2016
# Last Modified Date: 25 dec 2019
# Last Modified By  : Sam Uel <samuelfreitas@linuxmail.org>

if [ $(pgrep -cx $(basename $0)) -gt 1 ] ; then
    echo "The bBar is already running!" >&2
    exit 1
fi

#colors
black="#000000"
magenta="#af87d7"
white="#ffffff"

#icons
monitor_icon=""
user_icon=""
gpu_icon=""
wifi_icon=""
ethernet_icon=""
mem_icon=""
disk_icon=""
cpu_icon=""
battery_icon=""

curUser() {
    echo "%{+u}%{U${magenta}}%{F${white}}$(whoami)%{F-} %{-u}%{B${magenta}}%{F${black}} ${user_icon} %{F-}%{B-}"
}

net() {
    iface="$(cat /sys/class/net/enp1s0/operstate)"
    if [ "$iface" = "up" ]; then
        echo "%{F${white}} ${ethernet_icon} ${iface} %{F-}"
    else
        SSID="$(/sbin/iw dev wlp2s0 link | grep SSID | cut -d " " -f 2-)"

        if [ -z "$SSID" ]; then
            echo "%{F${white}} ${wifi_icon} down %{F-}"
        else
            echo "%{F${white}} ${wifi_icon} ${SSID} %{F-}"
        fi
    fi
}

mem() {
    echo "%{F${white}} ${mem_icon} $(free -h | awk '/Mem.:/{print $3}')/$(free -h | awk '/Mem.:/{print $2}') %{F-}"
}

disk() {
    echo "%{F${white}} ${disk_icon} $(df -hT /home | awk '/dev/ {print $5}') %{F-}"
}

cpu() {
    echo "%{F${white}} ${cpu_icon} $(sensors coretemp-isa-0000 | awk '/Package/ {print $4}') %{F-}"
}

pch() {
    echo "%{F${white}} ${gpu_icon} $(sensors pch_skylake-virtual-0 | awk '/temp1/ {print $2}')%{F-}"
}

battery() {
    charging=$(acpi | awk '{print $3}' | sed 's/,//')
    declare -i percent=$(acpi | awk '{print $4}' | sed -e 's/%//' -e 's/,//')

    if [ "$percent" -le 15 ] && [ "$charging" != "Charging" ]; then
       $(notify-send "Notebook is dying!!!")
       $(macopix --message-expire 6000 --message "Please, charge your notebook!!!")
    fi

    if [ "$charging" = "Charging" ] || [ "$charging" = "Full" ]; then
        echo "%{F${white}}  ${battery_icon} ${percent}%++%{F-}"
    else
        echo "%{F${white}}  ${battery_icon} ${percent}%--%{F-}"
    fi
}

while true; do
    echo "%{l}%{B${magenta}}%{F${black}} ${monitor_icon} %{F-}%{B-}%{+u}%{U${magenta}}$(net)$(mem)$(disk)$(cpu)$(pch)$(battery)%{-u}%{r} $(curUser)"
    sleep 10s
done | lemonbar -p -b -u 2 -f "FantasqueSansMono-11" -f "FontAwesome-11" -g 1920x20 &
wait
