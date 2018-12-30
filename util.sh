#!/usr/bin/env bash

DOTFILES=$HOME/dotfiles

# Escape Sequences - Colors
PURPLE="\033[38;5;140m"
RED="\033[38;5;1m"
YELLOW='\033[33m'

# Escape Sequences - Control
RESET="\033[0m"
BOLD="\033[1m"
BLINK="\033[5m"

info_msg() { printf "[${PURPLE}INFO${RESET}]${BOLD} %s${RESET}\n" "$*"; }
warn_msg() { printf "[${BLINK}${YELLOW}WARNING${RESET}]${BOLD} %s${RESET}\n" "$*"; }
err_msg() { printf "[${RED}ERROR${RESET}]${BOLD} %s${RESET}\n" "$*"; }
command_exists() { command -v $1 > /dev/null; }
