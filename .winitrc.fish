# why firefox why
set -x MOZ_DBUS_REMOTE 1
set -x MOZ_ENABLE_WAYLAND 1
set -x GDK_BACKEND wayland
set -x MOZ_WAYLAND_ENABLED 1

# tmp
set -x XDG_RUNTIME_DIR /tmp

# qt
set -x QT_QPA_PLATFORM wayland

# idk
set -x DISPLAY wayland-0

pipewire &

dbus-run-session niri --session
