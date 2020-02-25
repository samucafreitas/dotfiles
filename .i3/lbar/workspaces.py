#!/usr/bin/env pypy3
#
# Uses i3ipc-python -> https://github.com/acrisci/i3ipc-python
# Based on          -> https://github.com/acrisci/i3ipc-python/tree/master/examples
#
# File              : workspaces.py
# Date              : 29 nov 2016
# Last Modified Date: 22 jun 2018
# Last Modified By  : Sam Uel <samuelfreitas@linuxmail.org>
import os
import sys
import i3ipc
from lconf import *
from signal import SIGTERM
from subprocess import getoutput

i3 = i3ipc.Connection()

def display(ws_l):
    print(f'WPS {ws_l}', flush=True)

def format(workspaces, outputs):
    ws_l = ''
    for wps in workspaces:
        output = None
        for output_ in outputs:
            if output_.name == wps.output:
                output = output_
                break
        if not output: continue

        if get_state(wps, output) == 'FOC' or get_state(wps, output) == 'ACT':
            ws_l += '%{{B{bgColor}}} %{{F{fgColor}}} {wpIcon} %{{F-}} %{{B-}}'\
                    .format(bgColor=COLOR2,
                            fgColor=COLOR1,
                            wpIcon=WPS_ICONS[wps.num - 1])
        elif get_state(wps, output) == 'URG':
            ws_l += '%{{B{bgColor}}} %{{F{fgColor}}} {wpIcon} %{{F-}} %{{B-}}'\
                    .format(bgColor=COLOR1,
                            fgColor=COLOR2,
                            wpIcon=WPS_ICONS[wps.num - 1])
        else:
            ws_l += '%{{B{bgColor}}} %{{F{fgColor}}} {wpIcon} %{{F-}} %{{B-}}'\
                    .format(bgColor=COLOR1,
                            fgColor=COLOR3,
                            wpIcon=WPS_ICONS[wps.num - 1])
    return ws_l

def get_state(wps, output):
    focused = 'FOC'
    active = 'ACT'
    inactive = 'INA'
    urgent = 'URG'

    if wps.focused:
        if output.current_workspace == wps.name:
            return focused
        return active
    elif wps.urgent:
        return urgent

    return inactive

def change(self, e):
    if e.current:
        outputs = i3.get_outputs()
        workspaces = i3.get_workspaces()
        display(format(workspaces, outputs))

def shutdown(lain):
    loadbarspid = getoutput('pidof -x loadbars.sh')
    if loadbarspid:
        os.kill(int(loadbarspid), SIGTERM)
    sys.exit(0)

outputs = i3.get_outputs()
workspaces = i3.get_workspaces()
display(format(workspaces, outputs))

i3.on('workspace::', change)
i3.on('ipc-shutdown', shutdown)
i3.main()
