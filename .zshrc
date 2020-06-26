export ZSH=/home/samuel/.oh-my-zsh

ZSH_THEME="lambda"
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
alias audio-hdmi='pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:hdmi-stereo'
alias audio-pc='pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:analog-stereo'
alias hdmi-output='xrandr --output eDP-1 --off && xrandr --output HDMI-1 --auto && i3 restart'
alias nbk-output='xrandr --output HDMI-1 --off && xrandr --output eDP-1 --auto && i3 restart'

stty -ixon #Disable (XON/XOFF flow control)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
