# Home extension $PATH
if [[ $(uname) == "Darwin" ]]; then
    export PATH=/opt/homebrew/bin:$HOME/bin:/usr/local/bin:$PATH # MacOS
elif command -v apt > /dev/null; then
    export PATH=$PATH:/opt/nvim-linux64/bin # Debian
fi

# Config home location
export XDG_CONFIG_HOME="$HOME/.config"

# Colorized man pages with bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Setup asdf
export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

# Setup Golang
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export GO111MODULE=on

# Multiprocessing fork() behavior
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Basic zsh settings (replaces OMZ settings)
autoload -Uz compinit && compinit # Initialize completions
zstyle ':completion:*' menu select # Enable menu-style completions
setopt AUTO_CD                     # `dir` becomes `cd dir`
setopt EXTENDED_GLOB               # Extended globbing
setopt INTERACTIVE_COMMENTS        # Allow comments in interactive shell
setopt APPEND_HISTORY              # Append to history
setopt SHARE_HISTORY               # Share history between sessions
setopt HIST_IGNORE_DUPS            # Don't record duplicates
setopt HIST_REDUCE_BLANKS          # Remove superfluous blanks

# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Key bindings
bindkey -e                         # Emacs key bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Aliases
alias pn="pnpm"
alias vim="nvim"
alias ls="eza --color=always --long --icons=always --no-time --no-user --no-permissions"

# Editor settings
export EDITOR='nvim'

# Manually install and source plugins
# You'll need to clone these repositories:
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-history-substring-search ~/.zsh/zsh-history-substring-search
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# asdf
[[ -f $HOME/.asdf/asdf.sh ]] && source $HOME/.asdf/asdf.sh

# fzf
if [[ $(uname) == "Darwin" ]]; then
    eval "$(fzf --zsh)" # MacOS
elif command -v apt > /dev/null; then
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # Debian (git clone)
fi

# starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init --cmd cd zsh)"
