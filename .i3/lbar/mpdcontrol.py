#!/usr/bin/env python3
from sys import argv
from os import system, path
from mpd import MPDClient

BASE_DIR = path.dirname(path.realpath(__file__))
SONGSTATUS = path.join(BASE_DIR, 'songstatus.sh')

def connect(cli):
    try:
        cli.connect('localhost', 6600)
    except ConnectionError as err:
        print('[ERROR]->', err)
        exit(1)
    return cli

def on_state(cli):
    status = cli.status()
    return status['state']

def play_icon(cli):
    song_state = on_state(cli)

    if song_state == 'play':
        return ''
    return ''

def song_time(time):
    minutes, seconds = divmod(time, 60)
    return '({:02d}:{:02d})'.format(minutes, seconds)

def song_title(cli, song_popup=None):
    curr_song = cli.currentsong()
    song_state = on_state(cli)

    try:
        title = curr_song['title'][0:20]
    except KeyError:
        title = "<empty>"

    if song_popup == 'popup':
        if(song_state == 'pause'):
            system(f'{SONGSTATUS} Paused "{title}"')
        elif(song_state == 'stop'):
            system(f'{SONGSTATUS} Stopped')
        else:
            system(f'{SONGSTATUS} Playing "{title}"')
        return None

    if(song_state != 'stop'):
        return '{} {}'.format(title, song_time(int(curr_song['time'])))
    return '[-stopped-]'

def control(cli, btn):
    song_state = on_state(cli)

    if(btn == 'playBtn'):
        if(song_state == 'pause' or song_state == 'stop'):
            cli.play()
        else:
            cli.pause()

    elif(btn == 'stopBtn'):
        cli.stop()
    elif(btn  == 'prevBtn'):
        cli.previous()
    else:
        cli.next()

if __name__ == '__main__':
    cli = connect(MPDClient())
    arg = argv[1]

    if arg == 'popup':
        song_title(cli, arg)
    else:
        control(cli, arg)

    cli.close()
    cli.disconnect()
