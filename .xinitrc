#!/bin/bash
#           .__       .__  __
#    ___  __|__| ____ |__|/  |________   ____
#    \  \/  /  |/    \|  \   __\_  __ \_/ ___\
#     >    <|  |   |  \  ||  |  |  | \/\  \___
# /\ /__/\_ \__|___|  /__||__|  |__|    \___  >
# \/       \/       \/                      \/
# File              : .xinitrc
# Author            : Sam Uel <samuelfreitas@linuxmail.org>
# Date              : 10 jan 2016
# Last Modified Date: 18 feb 2018
# Last Modified By  : Sam Uel <samuelfreitas@linuxmail.org>

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

source .profile
numlockx &
/usr/lib/xfce-polkit/xfce-polkit &
compton -CG --config ~/.comptonrc &
setxkbmap -option caps:escape
dunst -conf ~/.dunstrc &
macopix --sockmsg &
thunar --daemon &
xset r rate 200 50 &

[[ -f ~/.Xresources ]] && xrdb -merge "${HOME}/.Xresources"

case $1 in
    xfce)
            exec startxfce4 ;;
    xmonad)
            feh --bg-scale ~/wallpapers/purple/girlUmb.jpg;
            exec xmonad ;;
    *)
            feh --bg-scale ~/wallpapers/purple/wallhaven.jpg;
            exec i3 ;;
esac
