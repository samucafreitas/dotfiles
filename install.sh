#!/usr/bin/env bash

source $HOME/dotfiles/util.sh

function select_branch {
    info_msg "Select a branch"
    select branch in "master" "nbk"; do
        case $branch in
            master) return;;
            nbk) git -C "$DOTFILES" checkout nbk && return;;
            *) warn_msg "Please, select a branch!";;
        esac
    done
}

select_branch
bash $DOTFILES/symlinks.sh
