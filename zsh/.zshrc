KEYTIMEOUT=1

source $HOME/.shell.sh
source $HOME/.oh-my-zsh/oh-my-zsh.sh

plugins=(
    git
    vi-mode
    virtualenv
    zsh-autosuggestions
    zsh-syntax-highlighting
)

ZSH_THEME="robbyrussell"


eval "$(starship init zsh)"
