#!/usr/bin/env python3
#
# Uses python-mpd2  -> https://github.com/Mic92/python-mpd2
#
# File              : lbar.py
# Author            : Sam Uel <samuelfreitas@linuxmail.org>
# Date              : 29 nov 2016
# Last Modified Date: 20 jan 2018
# Last Modified By  : Sam Uel <samuelfreitas@linuxmail.org>
from time import sleep
from os import path
from subprocess import getoutput
from mpd import MPDClient
from mpdcontrol import connect, song_title, play_icon
from lconf import *

BASE_DIR = path.dirname(path.realpath(__file__))
MPD_CONTROL_PATH = path.join(BASE_DIR, 'mpdcontrol.py')

def separator(fg_color, bg_color):
    return f'%{{B{bg_color}}}%{{F{fg_color}}}{SEP_ICON}%{{F-}}%{{B-}}'

############
#-----------BLOCKS
############
def vol():
    volume = getoutput("amixer get Master | awk '$0~/%/{print $4}' | tr -d '[]'").split('\n')[0]
    return '%{{A4: amixer -q sset Master 3%+:}}%{{A5: amixer -q sset Master 3%-:}}'\
            '{sep}%{{B{bgColor}}}%{{F{fgColor}}} {volIcon} {vol} %{{F-}}%{{B-}}%{{A}}%{{A}}'\
            .format(sep=separator(COLOR1, '-'),
                    bgColor=COLOR1,
                    fgColor=COLOR3,
                    volIcon=PL_ICONS['vol'],
                    vol=volume)

def date_time():
    date = getoutput('date "+%d/%m/%Y"')
    time = getoutput('date "+%H:%M"')

    return '{sep}%{{B{bgColor}}}%{{F{fgColor}}} {calIcon} '\
           '{dateIcon} {clockIcon} {timeIcon} %{{F-}}%{{B-}}'\
            .format(sep=separator(COLOR2, COLOR1),
                    bgColor=COLOR2,
                    fgColor=COLOR1,
                    calIcon=DT_ICONS['cal'],
                    dateIcon=date,
                    clockIcon=DT_ICONS['clock'],
                    timeIcon=time)

def mpd():
    cli = connect(MPDClient())
    song = song_title(cli)
    icon = play_icon(cli)

    cli.close()
    cli.disconnect()

    # All I see is pain!
    return (
            ' %{{F{playerColor}}}%{{A: {path} prevBtn:}}{prevIcon}%{{A}} '\
            ' %{{A: {path} playBtn:}}{play_icon}%{{A}} '\
            ' %{{A: {path} stopBtn:}}{stopIcon}%{{A}} '\
            ' %{{A: {path} nextBtn:}}{nextIcon}%{{A}}%{{F-}} '\
            ' %{{+u}}%{{U{ulColor}}}%{{A: {path} popup:}}'\
            ' %{{F{sIconColor}}}{sIcon}%{{F-}} %{{F{sTitleColor}}}{sTitle}%{{F-}} %{{A}}%{{-u}}'\
            ).format(path=MPD_CONTROL_PATH,
                     playerColor=COLOR4,
                     prevIcon=PL_ICONS['prev'],
                     play_icon=icon,
                     stopIcon=PL_ICONS['stop'],
                     nextIcon=PL_ICONS['next'],
                     ulColor=COLOR2,
                     sIconColor=COLOR4,
                     sIcon=PL_ICONS['headphone'],
                     sTitleColor=COLOR4,
                     sTitle=song)

if __name__ == '__main__':
    while True:
        print(f'BLOCKS {mpd()}{vol()}{date_time()}', flush=True)
        sleep(1)
