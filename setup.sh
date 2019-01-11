#!/usr/bin/env bash

source <(curl -s https://bitbucket.org/samucafreitas/dotfiles/raw/master/util.sh)

function clone_bitbucket {
    echo_msg "Cloning dotfiles repository from bitbucket..."
    if [[ $USER == samuel ]]; then
        repo=git@bitbucket.org:samucafreitas/dotfiles.git
    else
        repo=https://bitbucket.org/samucafreitas/dotfiles
    fi
    git clone --recursive "$repo" "$DOTFILES"
}

function clone_github {
    echo_msg "Cloning dotfiles repository from github..."
    if [[ $USER == samuel ]]; then
        repo=git@github.com:samucafreitas/dotfiles.git
    else
        repo=https://github.com/samucafreitas/dotfiles
    fi
    git clone --recursive "$repo" "$DOTFILES"
}

function select_cloud {
    info_msg "Select a cloud"
    select branch in "bitbucket" "github"; do
        case $branch in
            bitbucket) clone_bitbucket;;
            github) clone_github;;
            *) warn_msg "Please, select a cloud!";;
        esac
    done
}

function setup {
    if [ -d $DOTFILES ]; then
        warn_msg "Already installed dotfiles!"
        exit 1
    fi

    if command_exists git || command_exists zsh; then
        info_msg "Installing git and zsh with autosuggestions"
        if [[ -f /etc/arch-release ]]; then
            sudo pacman --needed --noconfirm -S git zsh
        elif [[ -f /etc/debian_version ]]; then
            sudo apt-get update && sudo apt-get install -y git zsh
        fi

        if [ ! -d $HOME/.zsh/zsh-autosuggestions ]; then
            git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
        fi
    fi

  select_cloud
}

setup
info_msg "$DOTFILES/install.sh to install dotfiles"
