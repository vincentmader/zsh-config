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
# │ Shell command history                                                     │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   Enable sharing of command history between multiple shell sessions.
    setopt sharehistory

#   Define path to command-history file. Set here rather than in a profile, so
#   that every interactive shell (login or not) writes to the same file.
    HISTFILE="$XDG_STATE_HOME/zsh/history"
    mkdir -p "${HISTFILE:h}"
#   TODO: Setup having only a single (shell-independent) history file?

#   Define format of timestamps for command-history.
    export HIST_STAMPS="yyyy-mm-dd"

#   Define nr. of command-history entries saved in memory.
    export HISTSIZE=10000

#   Define nr. of command-history entries saved to file.
    export SAVEHIST=100000

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Web search-engines                                                        │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   Define web search-engines, use with e.g. `web_search wikipedia euler`
    ZSH_WEB_SEARCH_ENGINES=(
        4chan           "https://4chan.org/"
        amazon          "https://amazon.de/s?k="
        archive         "https://web.archive.org/web/*/"
        archwiki        "https://wiki.archlinux.org/?search="
        arxiv           "https://arxiv.org/search/?searchtype=all&source=header&query="
        baidu           "https://www.baidu.com/s?wd="
        bing            "https://www.bing.com/search?q="
        brave           "https://search.brave.com/search?q="
        duckduckgo      "https://www.duckduckgo.com/?q="
        ebay            "https://ebay.de/sch/"
        ecosia          "https://www.ecosia.org/search?q="
        github          "https://github.com/search?q="
        github_vm       "https://github.com/vincentmader/"
        goodreads       "https://www.goodreads.com/search?q="
        google          "https://www.google.com/search?q="
        linkedin        "https://linkedin.com/search/results/all/?keywords="
        piratebay       "https://piratebay.party/search/"
        r               "https://www.reddit.com/r/"
        reddit          "https://www.reddit.com/search/?q="
        scholar         "https://scholar.google.com/scholar?q="
        stackoverflow   "https://stackoverflow.com/search?q="
        startpage       "https://www.startpage.com/do/search?q="
        twitter         "https://twitter.com/"
        urbandictionary "https://urbandictionary.com/define.php?term="
        wikipedia       "https://en.wikipedia.org/?search="
        wiktionary      "https://en.wiktionary.org/?search="
        wolframalpha    "https://www.wolframalpha.com/input/?i="
        yahoo           "https://search.yahoo.com/search?p="
        yandex          "https://yandex.ru/yandsearch?text="
        youtube         "https://www.youtube.com/results?search_query="
    )

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Completion & oh-my-zsh                                                    │
# ╰───────────────────────────────────────────────────────────────────────────╯
#   oh-my-zsh runs `compinit` itself, using the dump file at $ZSH_COMPDUMP.
#   Running it a second time here would rebuild the dump on every start.

#   Define path to oh-my-zsh installation.
    ZSH="$XDG_DATA_HOME/zsh/oh-my-zsh"

#   Define location for `zcompdump` files.
    ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"
#   The `zcompdump` files are produced to speed up the running of compinit,
#   which initializes the shell completion in zsh

#   Show completions in a menu that can be navigated.
    zstyle ':completion:*' menu select
    zmodload zsh/complist

#   Add completions for grok.
    fpath=(~/.grok/completions/zsh $fpath)

#   Without this directory, compinit cannot save its dump and starts slowly.
    mkdir -p "${ZSH_COMPDUMP:h}"

    ZSH_THEME="fletcherm"

#   Define list of plugins to be loaded by oh-my-zsh.
    plugins=(
#       # archlinux
#         colored-man-pages   # Add color to man-pages.
#         copyfile	    # Copy file to clipboard: `copyfile <file>`.
#         copypath	    # Copy pwd to clipboard:  `copypath <path>`.
#         copybuffer          # Copy the text in the prompt via `Ctrl-o`.
#       # dirhistory          # Use `Alt+Left/Right` to move through history, `Alt+Up` to go to parent.
#       # emoji-clock	    # Display time (30min. accuracy).
#         fzf                 # Enable fuzzy auto-completion.
#         git
#       # npm
#       # macos
#       # pip
#       # python
        sudo                # Press `Escape` twice to sudo repeat command.
#       # taskwarrior         # Add auto-completion for taskwarrior.
        web-search
#       # wd
    )
    source $ZSH/oh-my-zsh.sh

#   Include hidden files.
    _comp_options+=(globdots)

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Shell auto-complete                                                       │
# ╰───────────────────────────────────────────────────────────────────────────╯

    # dir="$ZSH/plugins/zsh-autocomplete"
    # url="https://github.com/marlonrichert/zsh-autocomplete.git"
    # [ -r $dir ] || git clone --depth 1 -- "$url" "$dir"
    # source "$dir/zsh-autocomplete.plugin.zsh"

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Command auto-suggest                                                      │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   Make command-suggestions case-insensitive.
    # export CASE_SENSITIVE="false"

#   Define strategy for getting command-suggestions.
    # export ZSH_AUTOSUGGEST_STRATEGY=(
    #     history
    #     completion
    # )

#   Define color of command suggestions.
    # export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#505050"

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
#    eval $(thefuck --alias)

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

# Sono: sono-agent <task> spawner
[ -r "$HOME/org/c_code/cz_vibe_coding/2026-06-07_sono_in_rust_by_Claude/utils/sono-agent.sh" ] && source "$HOME/org/c_code/cz_vibe_coding/2026-06-07_sono_in_rust_by_Claude/utils/sono-agent.sh"

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Shell syntax highlighting                                                 │
# ╰───────────────────────────────────────────────────────────────────────────╯
#   Must be sourced last: it wraps every widget defined before it.

#   Enable syntax-highlighting for zsh.
    dir="$ZSH/plugins/zsh-syntax-highlighting"
    url="https://github.com/zsh-users/zsh-syntax-highlighting.git"
    [ -r $dir ] || git clone "$url" "$dir"
    source "$dir/zsh-syntax-highlighting.zsh"
