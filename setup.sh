#!/usr/bin/env bash

source <(curl -s https://bitbucket.org/samucafreitas/dotfiles/raw/87a25ef7d2c1d82e1bdc9e8937da5f30b10ca41d/util.sh)

function clone_dotfiles {
    echo_msg "Cloning dotfiles repository..."
    if [[ $USER == samuel ]]; then
        repo=git@github.com:samucafreitas/dotfiles.git
    else
        repo=https://github.com/samucafreitas/dotfiles
    fi
    git clone --recursive "$repo" "$DOTFILES"
}

function setup {
    if [ -d DOTFILES ]; then
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

  clone_dotfiles
}

setup
info_msg "$DOTFILES/install.sh to install dotfiles"
