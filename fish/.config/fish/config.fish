if status is-interactive
    # Commands to run in interactive sessions can go here
end

# -g keeps PATH a session setting; without it fish_add_path saves absolute paths into fish_variables.
fish_add_path -g ~/.local/bin ~/.toolbox/bin
if test (uname) = Darwin
    fish_add_path -g /opt/homebrew/bin /opt/homebrew/opt/curl/bin
end

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

set fish_greeting ""
fish_vi_key_bindings

set -gx EDITOR nvim

alias v='nvim'
alias tmo='tmux new-session -A -s main'
starship init fish | source


if command -q brew; and test -d (brew --prefix asdf)
    . (brew --prefix asdf)/libexec/asdf.fish
    # -u writes ~/.tool-versions; a bare `asdf set` writes .tool-versions into the current directory.
    asdf set -u erlang 27.3.3
    asdf set -u elixir 1.18.3
    set ERLANG_HOME $(asdf where erlang)
end

# Settings that stay out of this public repo (work accounts, internal tools) live in ~/.config/fish-private/.
for f in ~/.config/fish-private/*.fish
    source $f
end
