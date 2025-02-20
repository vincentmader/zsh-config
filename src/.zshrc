#!/bin/sh
# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                      $XDG_CONFIG_HOME/zsh/zshrc                           ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# [ -z "$PS1" ] && return
# if [ -o login ] 
#     echo 
# fi
# [[ -o login ]] && print "" || echo "Non-Login"

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Zsh line editor                                                           │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   Enable vim mode.                            (NOTE: Use `-e` for emacs mode)
    bindkey -v

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Zcompdump setup                                                           │
# ╰───────────────────────────────────────────────────────────────────────────╯
#   -> can speed up auto-completion

#   TODO ... (Add description.)
    autoload -U compinit

#   TODO ... (Add description.)
    zstyle ':completion:*' menu select

#   TODO ... (Add description.)
    zmodload zsh/complist

#   TODO ... (Add description.)
    compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

#   Include hidden files.
    _comp_options+=(globdots)  

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Zoxide                                                                    │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   Initialize `zoxide`:
    eval "$(zoxide init zsh)"

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Source other zsh configuration files:                                     │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   Source shell-independent config:
    source "$XDG_CONFIG_HOME/sh/shellrc"

#   Source aliases:
    source "$XDG_CONFIG_HOME/sh/aliasrc"

#   Source prompter:
#   NOTE: Switch between e.g. `prompter_v1` and prompter_v2.
    source "$XDG_CONFIG_HOME/zsh/prompter_v2.sh"

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Various                                                                   │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   Speed up git for large repositories.
    DISABLE_UNTRACKED_FILES_DIRTY="true"  

#   Setup thefuck auto-correction.
    eval $(thefuck --alias)

#   TODO ... (Add description.)
    export KEYTIMEOUT=1

#   TODO ... (Add description.)
    autoload -U colors && colors

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ TMUX                                                                      │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   Check if tmux is running.
#   If not: start it!                       (and define default sessions: misc)
    #[ -z "${TMUX}" ] && tmux new-session -A -s "     misc              "

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Startup                                                                   │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   Run `exa` on start-up.  
    l  # (see ./aliasrc)

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                                                                           ║
# ║  NOTE: Stuff below is very unsorted, needs clean-up!!!                    ║
# ║                                                                           ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

  # export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

  # eval "$(starship init zsh)"
  # export PS3="hello"
  
  # cd $(cat $XDG_CONFIG_HOME/zsh/pwd)  # TODO load last saved pwd from file

  # xclip -o | xclip -selection clipboard -i
  
  # add color to man (I have as of yet only changed those with 38;5 at
  # the start, those are from the color set of size 256)
  # export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode – red
  # export LESS_TERMCAP_md=$(printf '\e[38;5;33m') # enter double-bright mode – bold, magenta
  # export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
  # export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
  # export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode – yellow
  # export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
  # export LESS_TERMCAP_us=$(printf '\e[38;5;118m') # enter underline mode – cyan
  
  # Better searching in command mode
  # bindkey -M vicmd '?' history-incremental-search-backward
  # bindkey -M vicmd '/' history-incremental-search-forward
  
  # Beginning search with arrow keys
  # bindkey "^[OA" up-line-or-beginning-search
  # bindkey "^[OB" down-line-or-beginning-search
  # bindkey -M vicmd "k" up-line-or-beginning-search
  # bindkey -M vicmd "j" down-line-or-beginning-search
  
  # Use lf to switch directories and bind it to ctrl-o
  # lfcd () {
  #     tmp="$(mktemp)"
  #     lf -last-dir-path="$tmp" "$@"
  #     if [ -f "$tmp" ]; then
  #         dir="$(cat "$tmp")"
  #         rm -f "$tmp"
  #         [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
  #     fi
  # }
  # bindkey -s '^o' 'lfcd\n'
  
  # Use vim keys in tab complete menu:
  # bindkey -M menuselect 'h' vi-backward-char
  # bindkey -M menuselect 'j' vi-down-line-or-history
  # bindkey -M menuselect 'k' vi-up-line-or-history
  # bindkey -M menuselect 'l' vi-forward-char
  # bindkey -v '^?' backward-delete-char
  # # Change cursor shape for different vi modes.
  # function zle-keymap-select {
  #   if [[ ${KEYMAP} == vicmd ]] ||
  #      [[ $1 = 'block' ]]; then
  #     echo -ne '\e[1 q'
  #   elif [[ ${KEYMAP} == main ]] ||
  #        [[ ${KEYMAP} == viins ]] ||
  #        [[ ${KEYMAP} = '' ]] ||
  #        [[ $1 = 'beam' ]]; then
  #     echo -ne '\e[5 q'
  #   fi
  # }
  # zle -N zle-keymap-select
  # zle-line-init() {
  #     # initiate "vi insert" as keymap
  #     # (can be removed if `bindkey -V` has been set elsewhere)
  #     zle -K viins
  #     echo -ne "\e[5 q"
  # }
  # zle -N zle-line-init
  # Use beam shape cursor on startup.
  # echo -ne '\e[5 q'
  # Use beam shape cursor for each new prompt.
  # preexec() { echo -ne '\e[5 q' ;}
  
  # Edit line in vim with ctrl-e:
  # autoload edit-command-line; zle -N edit-command-line
  # bindkey '^e' edit-command-line
   
  # ZSH_THEME='powerlevel9k/powerlevel9k'
  # POWERLEVEL9K_MODE="nerdfont-complete"
  # POWERLEVEL9K_LEFT_PROMPT_ELEMENTS = ('--\n--')

# ╭───────────────────────────────────────────────────────────────────────────╮
# │                                  FuzzyFind                                │
# ╰───────────────────────────────────────────────────────────────────────────╯
#    TODO sort-out unneeded stuff
    
  # [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  # setup default command
  # --files: List files that would be searched but do not search
  # --no-ignore: Do not respect .gitignore, etc...
  # --hidden: Search hidden files and folders
  # --follow: Follow symlinks
  # --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
  # include hidden files
  # export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
  # Use fd and fzf to get the args to a command.
  # Works only with zsh
  # Examples:
  # f mv # To move files. You can write the destination after selecting the files.
  # f 'echo Selected:'
  # f 'echo Selected music:' --extention mp3
  # fm rm # To rm files in current directory
  # f() {
  #     sels=( "${(@f)$(fd "${fd_default[@]}" "${@:2}"| fzf)}" )
  #     test -n "$sels" && print -z -- "$1 ${sels[@]:q:q}"
  # }
  
  # Deps
  #alias fz="fzf-noempty --bind 'tab:toggle,shift-tab:toggle+beginning-of-line+kill-line,ctrl-j:toggle+beginning-of-line+kill-line,ctrl-t:top' --color=light -1 -m"
  #fzf-noempty () {
  #	local in="$(</dev/stdin)"
  #	test -z "$in" && (
  #		exit 130
  #	) || {
  #		ec "$in" | fzf "$@"
  #	}
  #}
  #ec () {
  #	if [[ -n $ZSH_VERSION ]]
  #	then
  #		print -r -- "$@"
  #	else
  #		echo -E -- "$@"
  #	fi
  #}
  # fe [FUZZY PATTERN] - Open the selected file with the default editor
  #   - Bypass fuzzy finder if there's only one match (--select-1)
  #   - Exit if there's no match (--exit-0)
  # fe() {
  #   local files
  #   IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  #   [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
  # }
  # vf - fuzzy open with vim from anywhere
  # ex: vf word1 word2 ... (even part of a file name)
  # zsh autoload function
  #vf() {
  #  local files
  #
  #  files=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 -m)"})
  
  #  if [[ -n $files ]]
  #  then
  #     vim -- $files
  #     print -l $files[1]
  #  fi
  #}
  # fd - cd to selected directory
  #fd() {
  #  local dir
  #  dir=$(find ${1:-.} -path '*/\.*' -prune \
  #                  -o -type d -print 2> /dev/null | fzf +m) &&
  #  cd "$dir"
  #}
  # fda - including hidden directories
  #fda() {
  #  local dir
  #  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
  #}

LFCD="$XDG_CONFIG_HOME/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
    bindkey -s '^o' 'lfcd\n'
fi

# FUZZY AUTO-COMPLETION <3
 # 0 -- vanilla completion (abc => abc)
 # 1 -- smart case completion (abc => Abc)
 # 2 -- word flex completion (abc => A-big-Car)
 # 3 -- full flex completion (abc => ABraCadabra)
 zstyle ':completion:*' matcher-list '' \
   'm:{a-z\-}={A-Z\_}' \
   'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
   'r:|?=** m:{a-z\-}={A-Z\_}'

source /Users/vinc/.config/broot/launcher/bash/br
