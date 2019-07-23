export LANG=ja_JP.UTF-8
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin
export JAVA_HOME=`/usr/libexec/java_home -- v '1.*'`
export GOPATH="$HOME/go"
export GOROOT=`go env GOROOT`
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.pyenv/shims:$PATH"
export PATH="$PATH:$GOPATH/bin"

eval "$(pyenv init -)"
eval "$(rbenv init -)"

### Alias
alias ls="ls -GF"
alias ll="ls -l"
alias cl="clear"
alias vim="nvim"

### History
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt extended_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_no_store
setopt correct

### Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:sudo:*' command^path /usr/local/sbin /usr/localbin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

### PROMPT
autoload -Uz colors
colors

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats "%K{black} %c%u%b %k%f"
zstyle ':vcs_info:git:*' stagedstr "%F{green}*"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:git:*' actionformats '[%b | %a]'
precmd () { vcs_info }

PROMPT='%F{blue}%~%f ${vcs_info_msg_0_}
%F{magenta}>%f '

### Directry colors
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

### Look and feel
setopt print_eight_bit
setopt no_beep

### Register keybinds
# Change directory to selected ghq repoitory with peco: Ctrl-g
function peco-ghq() {
  local dest_dir=$(ghq list --full-path | peco --prompt "REPO>" --query "${LBUFFER}")
  if [ -n "${dest_dir}" ]; then
    BUFFER="cd ${dest_dir}"
    zle accept-line
  fi
}
zle -N peco-ghq
bindkey '^g' peco-ghq

### direnv - Unclutter your .profile
### https://github.com/zimbatm/direnv
eval "$(direnv hook zsh)"

### Load external source
[ -f ~/.zshrc.local] && source ~/.zshrc.local
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
