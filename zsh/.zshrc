# ============================================================================
# STREAMLINED ZSH CONFIGURATION
# Enhanced Zsh with Powerlevel10k prompt and modern file listing
# ============================================================================

# === POWERLEVEL10K INSTANT PROMPT ===
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# === OH-MY-ZSH CONFIGURATION ===
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# === ZSH OPTIONS ===
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 13

# === PLUGINS ===
plugins=(
    git
    golang
    docker
    docker-compose
    npm
    node
    nvm
    fzf
    command-not-found
    history-substring-search
    colored-man-pages
    colorize
    common-aliases
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
)

source $ZSH/oh-my-zsh.sh

# === ENVIRONMENT VARIABLES ===
# Go development
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Enhanced history
HISTCONTROL=ignoreboth
HISTSIZE=50000
HISTFILESIZE=100000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# Colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# === MODERN FILE LISTING WITH LSD ===
if command -v lsd &> /dev/null; then
    alias ls='lsd --group-dirs=first'
    alias ll='lsd -la --group-dirs=first'
    alias la='lsd -la --group-dirs=first'
    alias l='lsd -l --group-dirs=first'
    alias tree='lsd --tree'
    alias lt='lsd -la --sort=time'
else
    # Fallback to enhanced standard ls
    alias ls='ls --color=auto --group-directories-first'
    alias ll='ls -alF --color=auto'
    alias la='ls -A --color=auto'
    alias l='ls -CF --color=auto'
fi

# === GENERAL ALIASES ===
alias bat="batcat"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias vim='nvim'
alias vi='nvim'

# Git aliases (enhanced)
alias gst='git status'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gp='git push'
alias gpl='git pull'
alias gf='git fetch'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate'
alias glog='git log --oneline --graph --decorate --all'


# System aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias c='clear'
alias h='history'
alias j='jobs'
alias which='type -a'
alias du='du -h'
alias df='df -h'

# Development aliases
alias serve='python3 -m http.server'
alias py='python3'
alias pip='pip3'

# === CUSTOM FUNCTIONS ===
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Quick find function
qfind() {
    find . -name "*$1*"
}

# Extract any archive
extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# === EXTERNAL INTEGRATIONS ===

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# FZF integration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# === ENHANCED FEATURES ===

# Autosuggestions configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666,underline"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# Enhanced completion
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

# Keyboard navigation
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# === HELP FUNCTION ===
zsh_help() {
    echo "🎨 Enhanced Zsh Configuration"
    echo "============================"
    echo ""
    echo "🔧 Useful Aliases:"
    echo "  ll, la, l, tree, lt - Enhanced file listings with lsd"
    echo "  gst, gco, gp, gl    - Git shortcuts"
    echo "  mkcd <dir>          - Create and enter directory"
    echo "  extract <file>      - Extract any archive"
    echo "  py, pip             - Python shortcuts"
    echo "  serve               - Start HTTP server"
    echo ""
    echo "⚡ Features:"
    echo "  • Powerlevel10k prompt with instant loading"
    echo "  • Modern file listing with lsd and icons"
    echo "  • Enhanced history and completions"
    echo "  • Git integration and syntax highlighting"
    echo "  • FZF fuzzy finder integration"
    echo ""
}

# Load Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh 