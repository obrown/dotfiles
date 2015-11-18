BASE16_SHELL="$HOME/.dotfiles/base16-shell.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# autoload functions
autoload -U colors && colors
autoload -U compinit && compinit

# left and right prompt
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%#"
RPROMPT="[%!]"

# exported options
export PATH=$HOME/bin:/usr/local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"

export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export EDITOR='vim'

# input handling
bindkey -e # don't use vim line editing

# zsh options
setopt AUTO_PUSHD         # push directory when changing directory
setopt PUSHD_IGNORE_DUPS  # don't push the same directory twice

setopt APPEND_HISTORY     # append to same history file across different sessions
setopt EXTENDED_HISTORY   # save timestamps in history file
setopt INC_APPEND_HISTORY # don't wait until exit to append to history file
setopt HIST_IGNORE_DUPS   # don't insert duplicates into history file
setopt HIST_IGNORE_SPACE  # don't insert lines beginning with space
setopt HIST_FIND_NO_DUPS  # don't show duplicates when searching history
setopt HIST_REDUCE_BLANKS # don't clutter history file
setopt HIST_VERIFY        # expand history, don't execute

setopt ALWAYS_TO_END      # move cursor to end on autocomplete

setopt PRINT_EXIT_VALUE   # print non-zero exit values

setopt NO_BEEP            # don't beep on errors

setopt PROMPT_SUBST       # enable prompt substitutiion

# aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias lh='ls -d .*'
alias l='ls -alh'

alias man='man -a'

alias grep='egrep'

alias lab='ssh shell3.doc.ic.ac.uk'

alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

alias v='vim'
alias gm='git commit -m'
alias gp='git push'
alias ga='git add'
alias gs='git status'

alias tmux='TERM=screen-256color-bce tmux'
alias ls='ls --color'
