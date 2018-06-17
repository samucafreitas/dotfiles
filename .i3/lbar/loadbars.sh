#!/bin/sh

if [ $(pgrep -cx $(basename $0)) -gt 1 ] ; then
    echo "The loadbars is already running!" >&2
    exit 1
fi

# kill 0: kill all processes in the current process
trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

font="FantasqueSansMono-11"
icon_font="FontAwesome-11"
fg_color="#ffffff"
bg_color="#20202050" #BGA
geometry="x30"

lbar_fifo="/tmp/lbar_fifo"
[ -e "${lbar_fifo}" ] && rm "${lbar_fifo}"
mkfifo "${lbar_fifo}"

# WPS -> lbar_fifo; BLOCKS -> lbar_fifo
(pypy3 $(dirname $0)/workspaces.py > "${lbar_fifo}") &
(pypy3 $(dirname $0)/lbar.py > "${lbar_fifo}") &

# Initialize bbar.sh (Bottom Bar)
($(dirname $0)/bbar.sh) &

cat "${lbar_fifo}" | pypy3 $(dirname $0)/join.py | lemonbar -p -f "${font}" -f "${icon_font}" \
    -u 2 -F "${fg_color}" -B "${bg_color}" -g "${geometry}" | sh &
wait
