if status is-interactive
    # Commands to run in interactive sessions can go here
end

# why firefox why
set -x MOZ_DBUS_REMOTE 1
set -x MOZ_ENABLE_WAYLAND 1
set -x GDK_BACKEND wayland
set -x MOZ_WAYLAND_ENABLED 1

# tmp
set -x XDG_RUNTIME_DIR /tmp

# zig bin
set -x PATH $PATH $HOME/zig $HOME/nvim/bin /usr/local/go/bin $HOME/go/bin $HOME/.cargo/bin

# nvim bin
# set -x PATH $PATH /home/jimit/nvim/bin

# go bin
# set -x PATH $PATH /usr/local/go/bin:/home/jimit/go/bin

# set -x PATH $PATH $HOME/.cargo/env"

starship init fish | source

