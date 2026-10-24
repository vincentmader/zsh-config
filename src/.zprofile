#!/bin/sh
# -----------------------------------------------------------------------------
# 			            $XDG_CONFIG_HOME/zsh/zprofile
# -----------------------------------------------------------------------------
#   Read by login shells only. Sets up the environment (variables, PATH);
#   everything interactive lives in `.zshrc`, which every interactive shell
#   reads.

#   Source shell-independent (shared) profile config-file.
    source "$XDG_CONFIG_HOME/sh/profile"

##
# Your previous /Users/vinc/.zprofile file was backed up as /Users/vinc/.zprofile.macports-saved_2023-07-06_at_12:24:34
##

# MacPorts Installer addition on 2023-07-06_at_12:24:34: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your MANPATH environment variable for use with MacPorts.

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

# grok
export PATH="$HOME/.grok/bin:$PATH"

#   Drop duplicate PATH entries (keeping the first), so that tools adding
#   themselves again in nested login shells don't make PATH grow.
    typeset -U path
