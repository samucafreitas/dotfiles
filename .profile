export PATH=$PATH:$HOME/.stack/snapshots/x86_64-linux-ncurses6/lts-8.16/8.0.2/bin:/home/samuel/.stack/programs/x86_64-linux/ghc-ncurses6-8.0.2/bin:/usr/local/sbin:/usr/local/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/staruml/:/bin:/usr/bin

#Force eclipse to use GTK2 or 3
export SWT_GTK3=1

# RTV editor
export RTV_EDITOR=vim

# [dotfiles] bin
export PATH=$PATH:$HOME/bin

# ANDROID_HOME config
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Notification daemon
#case $XDG_CURRENT_DESKTOP in
#    i3|i3wm|xmonad)
#        ln -sfT "/usr/share/dbus-1/services/${SERVICE:-org.knopwob.dunst}.service" "${XDG_DATA_HOME:-$HOME/.local/share}/dbus-1/services/org.freedesktop.Notifications.service" ;;
#    MATE)
#        ln -sfT "/usr/share/dbus-1/services/${SERVICE:-org.freedesktop.mate.Notifications}.service" "${XDG_DATA_HOME:-$HOME/.local/share}/dbus-1/services/org.freedesktop.Notifications.service" ;;
#esac
