#!/bin/sh
#                             _________ __          __
#   __________   ____    ____ /   _____//  |______ _/  |_ __ __  ______
#  /  ___/  _ \ /    \  / ___\\_____  \\   __\__  \\   __\  |  \/  ___/
#  \___ (  <_> )   |  \/ /_/  >        \|  |  / __ \|  | |  |  /\___ \
# /____  >____/|___|  /\___  /_______  /|__| (____  /__| |____//____  >
#      \/           \//_____/        \/           \/                \/
# By Sam Uel
# Update: 15 jul 2018

if [ $(pgrep -cx $(basename $0)) -gt 1 ] ; then
    echo "The songstatus is already running!" >&2
    exit 1
fi

eval $(~/Documents/xppu/xppu -mouseposition)

state=$1
song_title=$2

#colors
magenta="#af87d7"
black="#202020"
gray="#b2aca2"

song_state() {
    if [ "$state" = "Playing" ]; then
        echo " Playing"
    elif [ "$state" = "Paused" ]; then
        echo " Paused"
    else
        echo " Stopped"
    fi
}

song_title() {
    if [ "$song_title" != "" ]; then
        echo " $song_title..."
    else
        echo " [-stopped-]"
    fi
}

(
    echo "%{r}%{F${magenta}} %{F-}%{B${magenta}} %{F${black}}$(song_state)%{F-} %{B-}%{F${magenta}}%{B${black}}%{B-}%{F-}%{B${black}} %{F${gray}}$(song_title)%{F-} %{B-}%{F${black}}%{F-}"; sleep 5
) | lemonbar -f "FantasqueSansMono-10" -f "FontAwesome-9" \
    -d -g 307x16+1350+34 | sh &
