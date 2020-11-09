sudo pacman -S pypy3 &&
sudo pacman -S mpd &&
sudo systemctl start mpd.service &&
pypy3 -m ensurepip &&
pypy3 -m pip install --upgrade pip setuptools wheel &&
pypy3 -m pip install i3ipc
