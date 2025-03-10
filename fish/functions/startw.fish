#!/usr/bin//env fish

# This file roughly emulates the startx command in that it setups up the
# environment for a Wayland session based upon what is specified in the
# `~/.winitrc` file.

set VERSION 1.1.1
set CONFIG # default in in .winiitrc file

# Keyboard Config String particulars
# - it is assumed that the string will be of the format:
# "layout;model;variant;options", e.g.
# "us;;;ctrl:nocaps" for a US keyboard with no caps-lock
set DIVIDER ";" # this is what we use to tokenise the string

# Some helper functions
function error_log
	echo $argv >&2
end

function parse_keyboard_string
	set -l keyboards $argv[1]
	set -l tokens (string split $DIVIDER $keyboards)
	set -gx XBD_DEFAULT_LAYOUT $tokens[1]
	set -gx XBD_DEFAULT_MODEL $tokens[2]
	set -gx XBD_DEFAULT_VARIANT $tokens[3]
	set -gx XBD_DEFAULT_OPTIONS $tokens[4]
end

# Parse arguments
# set -l options 'h' 'v' 'c:' 'k:'
# argparse $options -- $argv
argparse -n startw 'h/help' 'v/version' 'c/config=' 'k/keyboard=' -- $argv
or begin
	echo "Error: invalid arguments"
end

if set -q _flag_help
	echo "Usage: $argv[1] [-h/--help] [-v/--version] [-c/--config CONFIG] [-k/--keyboard KEYBOARDCONF]"
	exit 0
end

if set -q _flag_version
	echo "$argv[1] v. $VERSION"
	exit 0
end

if set -q _flag_config
	set CONFIG $_flag_c
end

if set -q _flag_keyboard
	parse_keyboard_string $_flag_k
end

# Sanity checks
# - make sure we aren't in X/Wayland session
set VT (tty)
if test (string sub -s 6 -l 1 $VT) != "t"
	error_log "Unable to start as we are in a X/Wayland session or PTS!"
	exit 1
end

# execute the .winitrc file
if test -n "$CONFIG"
	source $CONFIG
else
	source $HOME/.config/.winitrc.fish
end
