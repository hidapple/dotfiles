# ----------------------------------
# General settings
# ----------------------------------
### Environment variables
export LANG=ja_JP.UTF-8
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin
export JAVA_HOME=`/usr/libexec/java_home -v '1.8*'`
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export PATH="$HOME/.rbenv/shims:$PATH" # rbenv
export PATH="$HOME/.pyenv/shims:$PATH" # pyenv

### Alias
alias ls="ls -GF"
alias gls="gls --color"
alias gs="git status"

### Command histroy
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt extended_history
function histroy_all {histroy-E1}
setopt share_history
setopt hist_ignore_all_dups
setopt hist_no_store

### Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:sudo:*' command^path /usr/local/sbin /usr/localbin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# ----------------------------------
# Look and feel settings
# ----------------------------------
setopt print_eight_bit
setopt no_beep

### PROMPT
autoload -Uz colors
colors
PROMPT="%F{green}%n@%m [%~]%f
%# "

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:git:*' actionformats '[%b | %a]'
precmd () { vcs_info }
RPROMPT='${vcs_info_msg_0_}'

### Directry colors
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

