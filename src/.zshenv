# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                               ~/.zshenv                                   ║
# ╚═══════════════════════════════════════════════════════════════════════════╝
#   Read by every zsh (login or not, interactive or not), before anything else.
#   Keep it minimal: only what zsh needs to find the rest of its configuration.

#   XDG base directories. Also set in `sh/profile` for other shells; repeated
#   here so that non-login shells, which skip the profile, get them too.
    export XDG_CONFIG_HOME="$HOME/.config"
    export XDG_DATA_HOME="$HOME/.local/share"
    export XDG_CACHE_HOME="$HOME/.cache"
    export XDG_STATE_HOME="$HOME/.local/state"

#   Read `.zprofile` and `.zshrc` from here, so `~/.zshrc` is never used.
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
