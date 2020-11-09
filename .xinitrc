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

numlockx &
setxkbmap -option caps:escape &
xset r rate 199 50 &

[[ -f ~/.Xresources ]] && xrdb -merge "${HOME}/.Xresources"

function _apps {
    source .profile
    lxpolkit &
    picom -CG --config ~/.comptonrc &
    dunst -conf ~/.dunstrc &
    macopix --sockmsg &
    thunar --daemon &
    xpad &
}

case $2 in
    xfce)
        exec startxfce4 ;;
    xmonad)
        _apps
        feh --bg-scale ~/wallpapers/purple/girlUmb.jpg;
        exec xmonad ;;
    i3|i3wm)
        _apps
        feh --bg-scale ~/wallpapers/purple/wallhaven.jpg;
        exec i3 ;;
    *)
        exec mate-session ;;
esac
