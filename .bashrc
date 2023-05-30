#
# ~/.bashrc
#

# Export SHELL variables
export EDITOR=code
export HISTCONTROL=ignoreboth
export MANPAGER='nvim +Man!'

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
export PS1="${txtpur}\u${txtpur}@${txtpur}\h:${txtgrn}\w ${txtgrn}▶ ${txtrst}"

# A wrapper around grep
complete -W "\$(gf -list)" gf

# A smarter cd command
eval "$(zoxide init bash)"

# Controlling optional SHELL behavior
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

# Find the folder and open it directly in the EDITOR
fd() {
  DIR=$(find . -type d | fzf)
  $EDITOR "$DIR"
}

# Find the file and open it directly in the EDITOR
ff() {
  FILE=$(find . -type f | fzf)
  $EDITOR "$FILE"
}

# Create a folder and open it immediately
mc() {
  mkdir -p "$1"
  cd "$1" || exit
}

# Private PATH binaries
if [[ -d "$HOME/bin" ]]; then
  PATH="$HOME/bin:$PATH"
fi

if [[ -d "$HOME/.local/bin" ]]; then
  PATH="$HOME/.local/bin:$PATH"
fi

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
alias grep='grep --color=always'
alias wget='wget -c'
alias mkdir='mkdir -pv'
