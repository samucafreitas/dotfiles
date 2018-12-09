export ZSH=/home/samuel/.oh-my-zsh

ZSH_THEME="agnoster"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

plugins=(git)

source $ZSH/oh-my-zsh.sh

~/.msf

alias py2='python'
alias py3='python3'
alias ipy='ipython'
alias :q='exit'
alias ls='els --els-icons=fontawesome'
alias mw='cd ~/MWORLD/'
alias audio-hdmi='pactl set-default-sink alsa_output.pci-0000_01_00.1.hdmi-stereo'
alias audio-pc='pactl set-default-sink alsa_output.pci-0000_00_1b.0.analog-stereo'

stty -ixon #Disable (XON/XOFF flow control)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
