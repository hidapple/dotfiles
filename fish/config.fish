# Environment
set -gx LANG ja_JP.UTF-8
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx GOPATH $HOME/dev
set -gx LS_COLORS 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# Homebrew
eval (/opt/homebrew/bin/brew shellenv)

# PATH
fish_add_path $HOME/.local/bin $HOME/.cargo/bin $GOPATH/bin

# mise
mise activate fish | source

# Aliases
alias ls "ls -GF"
alias ll "ls -l"
alias cl clear
alias vim nvim
alias docc "docker compose"
alias k kubectl
alias cc 'tmux split-window -v -p 40 && tmux send-keys "claude" Enter'

# No beep
set -g fish_greeting

# direnv
direnv hook fish | source

# fzf
fzf --fish | source

# Keybindings
bind \cg ghq_fzf

# Local config
if test -f $XDG_CONFIG_HOME/fish/config.local.fish
    source $XDG_CONFIG_HOME/fish/config.local.fish
end
