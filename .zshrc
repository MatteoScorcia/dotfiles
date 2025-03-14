# Home extension $PATH
if [[ $(uname) == "Darwin" ]]; then
    export PATH=/opt/homebrew/bin:$HOME/bin:/usr/local/bin:$PATH # MacOS
elif command -v apt > /dev/null; then
    export PATH=$PATH:/opt/nvim-linux64/bin # Debian
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# tell lazygit this is home
export XDG_CONFIG_HOME="$HOME/.config"

# colorized man pages with bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# setup asdf
export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

# multiprocessing fork() behavior
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(asdf zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# aliases
alias pn="pnpm"
alias vim="nvim"
alias ls="eza --color=always --long --icons=always --no-time --no-user --no-permissions"

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

