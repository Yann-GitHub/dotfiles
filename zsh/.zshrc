#
# ~/.zshrc
#

# ~~~~~~~~~~~~~~~ Zsh options ~~~~~~~~~~~~~~~~~~~~~~~~~

setopt AUTO_CD

# ~~~~~~~~~~~~~~~ Environment ~~~~~~~~~~~~~~~~~~~~~~~~~

# Detect operating system

case "$(uname -s)" in
    Darwin)
        export EDITOR="code --wait"
        export VISUAL="code --wait"
        export CLICOLOR=1
        export LSCOLORS=GxFxCxDxBxegedabagaced
        ;;
    Linux)
        export EDITOR="nvim"
        export VISUAL="nvim"
        ;;
esac

# ~~~~~~~~~~~~~~~ Colors ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# GNU dircolors (Linux only)

if [[ "$(uname -s)" == "Linux" ]] && command -v dircolors >/dev/null 2>&1; then
    eval "$(dircolors -b)"
fi

# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~

export REPOS="$HOME/Repos"
export GITUSER="Yann-GitHub"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dotfiles"
export LAB="$GHREPOS/lab"
export SCRIPTS="$DOTFILES/scripts"
export ICLOUD="$HOME/icloud"
export ZETTELKASTEN="$HOME/Zettelkasten"

# ~~~~~~~~~~~~~~~ Path configuration ~~~~~~~~~~~~~~~~~~

# Keep PATH entries unique

typeset -U path

# User binaries

path=(
    "$HOME/.local/bin"
    "$HOME/bin"
    $path
)

# Prefer the official Neovim release for each system

NVIM_BIN=""

case "$OSTYPE" in
    linux*)
        NVIM_BIN="/opt/nvim-linux-arm64/bin"
        ;;
    darwin*)
        NVIM_BIN="$HOME/Applications/nvim-macos-x86_64/bin"
        ;;
esac

# Add Neovim to PATH only when installed

if [[ -n "$NVIM_BIN" && -x "$NVIM_BIN/nvim" ]]; then
    path=("$NVIM_BIN" $path)
fi

unset NVIM_BIN

# Initialize Homebrew environment when installed

if command -v brew >/dev/null 2>&1; then
    eval "$(brew shellenv)"
elif [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi


# Rust / Cargo

[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Go

path=("$HOME/go/bin" $path)

# ~~~~~~~~~~~~~~~ History ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Dedicated Zsh history file (Bash keeps ~/.bash_history)

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=5000
export SAVEHIST=10000

# Share history between Zsh sessions and append it to the history file

setopt HIST_APPEND
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS

# ~~~~~~~~~~~~~~~ Key bindings ~~~~~~~~~~~~~~~~~~~~~~~~

# Search history using the beginning of the current command

bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# ~~~~~~~~~~~~~~~ Functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~

mkcd() {
    if [[ -z "$1" ]]; then
        echo "Usage: mkcd <directory>"
        return 1
    fi

    mkdir -p -- "$1" && cd -- "$1"
}

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# General

if [[ "$OSTYPE" == "linux"* ]]; then
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# npm

alias ni='npm install'
alias nr='npm run'
alias ns='npm start'
alias nt='npm test'

# Filesystem

alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'

# OS-specific open command

if [[ "$(uname -s)" == "Darwin" ]]; then
    alias o='open'
elif [[ "$(uname -s)" == "Linux" ]]; then
    alias o='xdg-open'
fi

# Git

alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
alias gd='git diff'
alias gi='git init'
alias gl='git log'
alias gp='git pull'
alias gpsh='git push'
alias gss='git status -sb'
alias gs='printf "\n**\nDO NOT FORGET TO PULL BEFORE COMMITTING\n**\n\n"; git status'

# Navigation

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias c='clear'
alias repos='cd "$REPOS"'
alias lab='cd "$LAB"'
alias scripts='cd "$SCRIPTS"'
alias dots='cd "$DOTFILES"'
alias in='cd "$ZETTELKASTEN/Inbox"'
alias zk="cd \$ZETTELKASTEN"

# Fabric (macOS)

if [[ "$OSTYPE" == "darwin"* ]]; then
  alias fabric='fabric-ai'
fi

# ~~~~~~~~~~~~~~~ NVM ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

export NVM_DIR="$HOME/.nvm"

if [[ -s "$NVM_DIR/nvm.sh" ]]; then
    source "$NVM_DIR/nvm.sh"
fi

# ~~~~~~~~~~~~~~~ Completions ~~~~~~~~~~~~~~~~~~~~~~~~~

# Personal Zsh completion functions

#fpath=("$HOME/.zfunc" $fpath)

autoload -Uz compinit
compinit

# Interactive completion menu
zstyle ':completion:*' menu select

# Include hidden files in completion
setopt GLOB_DOTS

# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Starship prompt

if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

# ~~~~~~~~~~~~~~~ Misc ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

