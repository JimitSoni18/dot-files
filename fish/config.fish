if status is-interactive
    # Commands to run in interactive sessions can go here
end

# zig, nvim, go, go-installs, cargo and cargo-installs, desktop entries, clangd, lapce
set -x PATH $PATH $HOME/zig $HOME/nvim/bin /usr/local/go/bin $HOME/go/bin $HOME/.cargo/bin $HOME/.local/bin $HOME/clangd/bin $HOME/Lapce

# set -x $XDG_RUNTIME_DIR /tmp

set --universal nvm_default_version lts

set -x CARGO_TARGET_DIR $HOME/.cargo-target/

starship init fish | source

alias docker podman
alias docker-compose podman-compose

