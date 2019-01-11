#!/bin/sh
# ___.  __________
# \_ |__\______   \_____ _______
#  | __ \|    |  _/\__  \\_  __ \
#  | \_\ \    |   \ / __ \|  | \/
#  |___  /______  /(____  /__|
#      \/       \/      \/
# File              : bbar.sh
# Author            : Sam Uel <samuelfreitas@linuxmail.org>
# Date              : 07 dec 2016
# Last Modified Date: 18 feb 2018
# Last Modified By  : Sam Uel <samuelfreitas@linuxmail.org>

if [ $(pgrep -cx $(basename $0)) -gt 1 ] ; then
    echo "The bBar is already running!" >&2
    exit 1
fi

#colors
black="#000000"
red="#db3f62"
white="#ffffff"

#icons
monitor_icon=""
user_icon=""
gpu_icon=""
net_icon=""
mem_icon=""
disk_icon=""
cpu_icon=""

curUser() {
    echo "%{+u}%{U${red}}%{F${white}}$(whoami)%{F-} %{-u}%{B${red}}%{F${black}} ${user_icon} %{F-}%{B-}"
}

net() {
    iface="$(cat /sys/class/net/enp3s0/operstate)"
    echo "%{F${white}} ${net_icon} ${iface} %{F-}"
}

mem() {
    echo "%{F${white}} ${mem_icon} $(free -h | awk '/Mem:/{print $3}')/$(free -h | awk '/Mem:/{print $2}') %{F-}"
}

disk() {
    echo "%{F${white}} ${disk_icon} $(df -hT /home | awk '/dev/ {print $5}') %{F-}"
}

cpu() {
    echo "%{F${white}} ${cpu_icon} $(sensors coretemp-isa-0000 | awk '/Package/ {print $4}') %{F-}"
}

gpu() {
    echo "%{F${white}} ${gpu_icon} $(sensors radeon-pci-0100 | awk '/temp1/ {print $2}')%{F-}"
}

while true; do
    echo "%{l}%{B${red}}%{F${black}} ${monitor_icon} %{F-}%{B-}%{+u}%{U${red}}$(net)$(mem)$(disk)$(cpu)$(gpu)%{-u}%{r} $(curUser)"
    sleep 10s
done | lemonbar -p -b -u 2 -f "FantasqueSansMono Nerd Font-10" -f "FontAwesome-10" -g x20 &
wait
