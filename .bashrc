#
# ~/.bashrc
#

# export shell variables
export EDITOR=code
export HISTCONTROL=ignoreboth
export MANPAGER='nvim +Man!'

# colours have names too
txtblk='\[\e[0;30m\]' # black
txtred='\[\e[0;31m\]' # red
txtgrn='\[\e[0;32m\]' # green
txtylw='\[\e[0;33m\]' # yellow
txtblu='\[\e[0;34m\]' # blue
txtpur='\[\e[0;35m\]' # purple
txtcyn='\[\e[0;36m\]' # cyan
txtwht='\[\e[0;37m\]' # white
txtrst='\[\e[0m\]'    # text reset

# prompt pending patents
export PS1="${txtpur}\u${txtpur}@${txtpur}\h:${txtgrn}\w ${txtgrn}▶ ${txtrst}"

# a wrapper around grep
complete -W "\$(gf -list)" gf

# a smarter cd command
eval "$(zoxide init bash)"

# control optional shell behavior
shopt -s autocd

# readline variables
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind 'set colored-completion-prefix on'
bind 'set colored-stats on'
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'

# auto print list if open directory
cd() {
  builtin cd "$@" || exit
  exa -a --color=always --group-directories-first
}

# find the folder and open it directly in the editor
fd() {
  DIR=$(find . -type d | fzf)
  $EDITOR "$DIR"
}

# find the file and open it directly in the editor
ff() {
  FILE=$(find . -type f | fzf)
  $EDITOR "$FILE"
}

# create a folder and immediately open the folder
mc() {
  mkdir -p "$1"
  cd "$1" || exit
}

# personal binaries
if [[ -d "$HOME/bin" ]]; then
  PATH="$HOME/bin:$PATH"
fi

if [[ -d "$HOME/.local/bin" ]]; then
  PATH="$HOME/.local/bin:$PATH"
fi

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# issue a forced command for this
alias cp='cp -frv'
alias mv='mv -fv'
alias rm='rm -frv'

# replace ls with exa
alias ls='exa -al --color=always --group-directories-first'
alias la='exa -a --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'

# another command
alias grep='grep --color=always'
alias wget='wget -c'
alias mkdir='mkdir -pv'
