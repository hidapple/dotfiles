# Created by newuser for 5.0.6

# Env vars
export LANG=ja_JP.UTF-8
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin
export PGDATA=/usr/local/var/postgres
export JAVA_HOME=`/usr/libexec/java_home -v '1.8*'`
export GLASSFISH_HOME=/usr/local/opt/glassfish/libexec
export PATH=${PATH}:${GLASSFISH_HOME}/bin
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# alias
alias ls="ls -GF"
alias gls="gls --color"

autoload -Uz colors
colors

# Prompt
local p_info="%F{green}%n@%m$%f "
local p_cdir="%F{green}[%~]%f"
PROMPT="$p_info"
RPROMPT="$p_cdir"

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' actionformats '[%b | %a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

# Directry colors
autoload -Uz compinit
compinit
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# histroy
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt extended_history
function histroy_all {histroy-E1}
setopt share_history
setopt hist_ignore_all_dups # 同じコマンドを履歴に記録しない
setopt hist_no_store

#################################
# 補完
# 補完で小文字を大文字にマッチさせる
zstyle  ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# sudo の後ろでコマンド名を保管する
zstyle ':completion:*:sudo:*' command^path /usr/local/sbin /usr/localbin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# psのコマンドプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

################################
# option
setopt print_eight_bit
setopt no_beep

# rbenv
export PATH="$HOME/.rbenv/shims:$PATH"

# pyenv
export PATH="$HOME/.pyenv/shims:$PATH"
