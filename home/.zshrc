# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tgordon/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Postgres
export LOCAL_DB=~/postgres
export PGHOST=$LOCAL_DB
export PGDATA=$LOCAL_DB/data

alias start_postgres='pg_ctl -w -l ~/postgres_server.log start -o "-c listen_addresses= -c unix_socket_directories=$LOCAL_DB"'
alias stop_postgres='pg_ctl stop'



#~ # Enable highlighting and autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Keyboard shortcuts
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey '^[[1;5C' forward-word  # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word # [Ctrl-LeftArrow] - move backward one word

#~ if [[ "${terminfo[kcbt]}" != "" ]]; then
  #~ bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
#~ fi

# Fix delete key
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

# ls colors
zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
eval `dircolors ~/.dircolors`

# Aliases
alias ls='ls --color'

# Dotfile manager
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
