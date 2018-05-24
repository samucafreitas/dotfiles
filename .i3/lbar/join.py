#!/usr/bin/env pypy3
left_blocks = '' # wps
right_blocks = '' # mpd, volume, date...

while True:
    fifo = input()
    if fifo.startswith('WPS'):
        left_blocks = fifo[4:]
    if fifo.startswith('BLOCKS'):
        right_blocks = fifo[7:]
    print(f'%{{l}}{left_blocks}%{{r}}{right_blocks}', flush=True)
