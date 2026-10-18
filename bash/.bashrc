#
# ~/.bashrc
#

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
esa


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
export PATH="$HOME/bin:$PATH"

if command -v brew &>/dev/null; then
    eval "$(brew shellenv)"
fi


# ~~~~~~~~~~~~~~~ History ~~~~~~~~~~~~~~~~~~~~~~~~


# Configure history size, duplicate handling, and synchronization between shells.
export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth

PROMPT_COMMAND='history -a; history -n'c


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

# vim & second brain
alias in="cd \$ZETTELKASTEN/0 Inbox/"
alias zk="cd \$ZETTELKASTEN"

# ~~~~~~~~~~~~~~~ Completions ~~~~~~~~~~~~~~~~~~~~~~~~


# Enable Bash completion for NVM.
if [ -s "$NVM_DIR/bash_completion" ]; then
    source "$NVM_DIR/bash_completion"
fi


# ~~~~~~~~~~~~~~~ Sourcing ~~~~~~~~~~~~~~~~~~~~~~~~


# Load NVM and select the stable Node.js version.
export NVM_DIR="$HOME/.nvm"

if [ -s "$NVM_DIR/nvm.sh" ]; then
    source "$NVM_DIR/nvm.sh"
fi


# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~


# Initialize Starship prompt. Moved to starship for all my prompt needs.
eval "$(starship init bash)"


# ~~~~~~~~~~~~~~~ Misc ~~~~~~~~~~~~~~~~~~~~~~~~