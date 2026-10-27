#
# ~/.bashrc
#

# ~~~~~~~~~~~~~~~ Bash options ~~~~~~~~~~~~~~~~~~~~~~~~

# Allow entering a directory without typing cd.
shopt -s autocd

# Append history instead of overwriting it.
shopt -s histappend

# ~~~~~~~~~~~~~~~ Environment ~~~~~~~~~~~~~~~~~~~~~~~~

# Configure editor and terminal colors depending on the operating system.
case "$OSTYPE" in
darwin*)
  export EDITOR='code --wait'
  export VISUAL='code --wait'

  export CLICOLOR=1
  export LSCOLORS=GxFxCxDxBxegedabagaced
  ;;

linux*)
  export EDITOR='nvim'
  export VISUAL='nvim'
  ;;
esac

# ~~~~~~~~~~~~~~~ Colors ~~~~~~~~~~~~~~~~~~~~~~~~

if [[ "$OSTYPE" == linux* ]] && [ -x /usr/bin/dircolors ]; then
  if [ -r "$HOME/.dircolors" ]; then
    eval "$(dircolors -b "$HOME/.dircolors")"
  else
    eval "$(dircolors -b)"
  fi

  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~

# Set to superior editing mode

#set -o vi

#export VISUAL=nvim
#export EDITOR=nvim
#export TERM="tmux-256color"

# config
#export BROWSER="firefox"

# Directories

export REPOS="$HOME/Repos"
export GITUSER="Yann-GitHub"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dotfiles"
export LAB="$GHREPOS/lab"
export SCRIPTS="$DOTFILES/scripts"
export ICLOUD="$HOME/icloud"
export ZETTELKASTEN="$HOME/Zettelkasten"

# ~~~~~~~~~~~~~~~ Path configuration ~~~~~~~~~~~~~~~~~~~~~~~~

# Add personal and package-managed executables to PATH.
# if [[ "$OSTYPE" == linux* ]] && [[ -x /opt/nvim-linux-arm64/bin/nvim ]]; then
#   export PATH="/opt/nvim-linux-arm64/bin:$PATH"
# fi
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# Prefer the official Neovim release for each system.
NVIM_BIN=""
case "$OSTYPE" in
linux*)
  NVIM_BIN="/opt/nvim-linux-arm64/bin"
  ;;
darwin*)
  NVIM_BIN="$HOME/Applications/nvim-macos-x86_64/bin"
  ;;
esac

# Add Neovim to PATH only when installed and not already present.
if [[ -n "$NVIM_BIN" && -x "$NVIM_BIN/nvim" ]]; then
  case ":$PATH:" in
  *":$NVIM_BIN:"*) ;;
  *) export PATH="$NVIM_BIN:$PATH" ;;
  esac
fi

unset NVIM_BIN

# Initialize Homebrew environment when installed.
if command -v brew &>/dev/null; then
  eval "$(brew shellenv)"
fi

# ~~~~~~~~~~~~~~~ Rust / Cargo ~~~~~~~~~~~~~~~~~~~~~~~~

# Load Rust and Cargo environment variables.
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# ~~~~~~~~~~~~~~~ Go ~~~~~~~~~~~~~~~~~~~~~~~~

# Add Go binaries to PATH.
export PATH="$HOME/go/bin:$PATH"

# ~~~~~~~~~~~~~~~ History ~~~~~~~~~~~~~~~~~~~~~~~~

# Configure history size
export HISTSIZE=5000
export HISTFILESIZE=10000

#Ignore commands prefixed with a space and consecutive duplicates.
export HISTCONTROL=ignoreboth

# Append commands to the history file and import new commands from other sessions.
shopt -s histappend
PROMPT_COMMAND='history -a; history -n'

# ~~~~~~~~~~~~~~~ Readline ~~~~~~~~~~~~~~~~~~~~~~~~

# Search command history by prefix with the arrow keys.
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# ~~~~~~~~~~~~~~~ SSH ~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~ Functions ~~~~~~~~~~~~~~~~~~~~~~~~

# Create a directory and enter it.
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~

# Node / npm

alias ni='npm install'
alias ns='npm start'
alias nr='npm run'

# Filesystem
alias ..="cd .."
alias l='ls'
alias ll='ls -al'

case "$OSTYPE" in
darwin*)
  alias o='open .'
  ;;
linux*)
  alias o='xdg-open .'
  ;;
esac

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

alias dot='cd "$DOTFILES"'
alias lab='cd "$LAB"'
alias scripts='cd "$SCRIPTS"'
alias in="cd \$ZETTELKASTEN/Inbox"
alias zk="cd \$ZETTELKASTEN"

# Fabric (macos aja)

if [[ "$OSTYPE" == "darwin"* ]]; then
  alias fabric='fabric-ai'
fi

# ~~~~~~~~~~~~~~~ Sourcing ~~~~~~~~~~~~~~~~~~~~~~~~

# Load NVM and select the stable Node.js version.
export NVM_DIR="$HOME/.nvm"

if [ -s "$NVM_DIR/nvm.sh" ]; then
  source "$NVM_DIR/nvm.sh"
fi

# ~~~~~~~~~~~~~~~ Completions ~~~~~~~~~~~~~~~~~~~~~~~~

# Enable Bash completion for NVM.
if [ -s "$NVM_DIR/bash_completion" ]; then
  source "$NVM_DIR/bash_completion"
fi

# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~

# Initialize Starship if installed.
if command -v starship &>/dev/null; then
  eval "$(starship init bash)"
fi

# ~~~~~~~~~~~~~~~ Misc ~~~~~~~~~~~~~~~~~~~~~~~~
