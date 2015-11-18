# Base16 Shell
BASE16_SHELL="$HOME/.dotfiles/base16-shell.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

autoload -U colors && colors

PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%#"
RPROMPT="[%!]"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="mm/dd/yyyy"

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"
export CLICOLOR=1

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

# aliases
alias v="vim"
alias ls="ls --color"
alias lab="ssh shell3.doc.ic.ac.uk"
