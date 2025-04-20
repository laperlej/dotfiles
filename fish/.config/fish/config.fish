if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""
fish_vi_key_bindings

bass source $HOME/.shell.sh

function tmo
    tmux new-session -A -s main
end

function build-rec
    brazil-recursive-cmd --allPackages brazil-build
end

starship init fish | source

