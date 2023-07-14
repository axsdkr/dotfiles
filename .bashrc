#
# ~/.bashrc
#

# Export shell variables
export EDITOR=nvim
export HISTCONTROL=ignoreboth
export MANPAGER='nvim +Man!'
export PATH=$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH

# Colors also have names
txtblk='\[\e[0;30m\]' # Black
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
txtrst='\[\e[0m\]'    # Reset

# Apply for pending patents
export PS1="${txtpur}\u${txtpur}@${txtpur}\h:${txtgrn}\w ${txtgrn}» ${txtrst}"

# A wrapper around grep
complete -W "\$(gf -list)" gf

# A smarter cd command
eval "$(zoxide init bash)"

# Controlling optional shell behavior
shopt -s autocd

# Readline variables
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind 'set colored-completion-prefix on'
bind 'set colored-stats on'
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'

# Auto print list if open directory
cd() {
  builtin cd "$@" || exit
  exa -a --color=always --group-directories-first
}

# Find the folder and open it directly in the editor
fd() {
  DIR=$(find . -type d | fzf)
  $EDITOR "$DIR"
}

# Find the file and open it directly in the editor
ff() {
  FILE=$(find . -type f | fzf)
  $EDITOR "$FILE"
}

# Create a folder and open it immediately
mc() {
  mkdir -p "$1"
  cd "$1" || exit
}

# Navigate back
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Issued a forced command for this
alias cp='cp -frv'
alias mv='mv -fv'
alias rm='rm -frv'

# Replace ls with exa
alias ls='exa -al --color=always --group-directories-first'
alias la='exa -a --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'

# Another command
alias :q='exit'
alias cat='bat -pp --theme base16-256'
alias g='git'
alias grep='grep --color=always'
alias mkdir='mkdir -pv'
alias v='env -u WAYLAND_DISPLAY neovide --frame none --maximized --multigrid'
alias wget='wget -c'
