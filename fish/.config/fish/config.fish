if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""
fish_vi_key_bindings

bass source $HOME/.shell.sh

alias build-rec='brazil-recursive-cmd --allPackages brazil-build'
alias tmo='tmux new-session -A -s main'
alias bb=brazil-build
alias bba='brazil-build apollo-pkg'
alias bre='brazil-runtime-exec'
alias brc='brazil-recursive-cmd'
alias bws='brazil ws'
alias bwsuse='bws use -p'
alias bwscreate='bws create -n'
alias brc=brazil-recursive-cmd
alias bbr='brc brazil-build'
alias bball='brc --allPackages'
alias bbb='brc --allPackages brazil-build'
alias bbra='bbr apollo-pkg'

starship init fish | source

