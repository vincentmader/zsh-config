#!/bin/sh
# -----------------------------------------------------------------------------
# 			            $XDG_CONFIG_HOME/zsh/zprofile
# -----------------------------------------------------------------------------

#   Source shell-independent (shared) profile config-file.
    source "$HOME/.config/shell/profile"
 
#   Define path to zsh config-file.
    export ZSHRC="$XDG_CONFIG_HOME/zsh/zshrc"

#   Define path to oh-my-zsh installation.
    export ZSH="$XDG_CONFIG_HOME/zsh/oh-my-zsh"

#   TODO ... (description)
    export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"

#   TODO ... (description)
  # export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Web search-engines                                                        │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   Define web search-engines, use with e.g. `web_search wikipedia euler`
    export ZSH_WEB_SEARCH_ENGINES=(
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
# │ List of plugins                                                           │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   Define list of plugins to be loaded by oh-my-zsh.
#     plugins=(
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
#         sudo                # Press `Escape` twice to sudo repeat command.
#       # taskwarrior         # Add auto-completion for taskwarrior.
#         web-search
#       # wd                  
#         zsh-autosuggestions
#     )
#     source $ZSH/oh-my-zsh.sh

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Shell syntax highlighting                                                 │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   Define path to oh-my-zsh plugins.
#     PATH_TO_PLUGINS="$XDG_CONFIG_HOME/zsh/oh-my-zsh/plugins" 

#   Enable syntax-highlighting for zsh.
#    source $PATH_TO_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Shell command history                                                     │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   Enable sharing of command history between multiple shell sessions.
    setopt sharehistory

#   Define path to command-history file.
    HISTFILE="$XDG_CACHE_HOME/zsh/history"
#   NOTE: This is overwritten in `../zsh/zshrc` for zsh-specific history.
#   TODO: Setup having only a single (shell-independent) history file?

#   Define format of timestamps for command-history.
    export HIST_STAMPS="yyyy-mm-dd"

#   Define nr. of command-history entries saved in memory.
    export HISTSIZE=10000

#   Define nr. of command-history entries saved to file.
    export SAVEHIST=100000

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Command auto-suggest                                                      │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   Make command-suggestions case-insensitive. 
    export CASE_SENSITIVE="false"  

#   Define strategy for getting command-suggestions.
    export ZSH_AUTOSUGGEST_STRATEGY=(
        history 
        completion
    )

#   Define color of command suggestions.
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#505050"  

# ╭───────────────────────────────────────────────────────────────────────────╮
# │ Java                                                                      │
# ╰───────────────────────────────────────────────────────────────────────────╯

#   TODO ... (Add description.)
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"


##
# Your previous /Users/vinc/.zprofile file was backed up as /Users/vinc/.zprofile.macports-saved_2023-07-06_at_12:24:34
##

# MacPorts Installer addition on 2023-07-06_at_12:24:34: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your MANPATH environment variable for use with MacPorts.

