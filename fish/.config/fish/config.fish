if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""
fish_vi_key_bindings

bass source $HOME/.shell.sh

set -gx SAM_ASSUME_ACCOUNT_ID 929962505089
set -gx SAM_ISENGARD_ROLE_NAME Admin
set -gx SAM_ASSUME_ACCOUNT_ID_RABBITMQ 678817682165
set -gx SAM_ISENGARD_ROLE_NAME_RABBITMQ Admin

set -gx PLATFORM_ACCOUNT 929962505089
set -gx PLATFORM_PROFILE rabbit-dev
set -gx RABBIT_ACCOUNT 678817682165
set -gx RABBIT_PROFILE active-dev

function refresh_bedrock
    set -gx AWS_PROFILE rabbit-dev
    set -gx AWS_REGION us-west-2
    set -gx AWS_ACCESS_KEY_ID $(ada cred print --profile=$AWS_PROFILE | jq -r ".AccessKeyId")
    set -gx AWS_SECRET_ACCESS_KEY $(ada cred print --profile=$AWS_PROFILE | jq -r ".SecretAccessKey")
    set -gx AWS_SESSION_TOKEN $(ada cred print --profile=$AWS_PROFILE | jq -r ".SessionToken")
    set -gx BEDROCK_KEYS "$AWS_ACCESS_KEY_ID,$AWS_SECRET_ACCESS_KEY,$AWS_REGION,$AWS_SESSION_TOKEN"
end
refresh_bedrock

fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/curl/bin

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


. (brew --prefix asdf)/libexec/asdf.fish

asdf set erlang 27.3.3
asdf set elixir 1.18.3
set ERLANG_HOME $(asdf where erlang)
