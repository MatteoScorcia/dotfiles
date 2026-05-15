# 🍄 matteo's dotfiles

## 🛠️ The Stack

| Category        | Tool                                                    | Description                                                         |
| :-------------- | :------------------------------------------------------ | :------------------------------------------------------------------ |
| **Terminal**    | [Ghostty](https://ghostty.org/)                         | Fast, native renderer with modern features                          |
| **Shell**       | [Zsh](https://www.zsh.org/)                             | Enhanced with Starship, Autosuggestions, and Zoxide                 |
| **Editor**      | [Neovim](https://neovim.io/)                            | [LazyVim](https://www.lazyvim.org/) distribution with custom tweaks |
| **Multiplexer** | [Tmux](https://github.com/tmux/tmux)                    | Managed via TPM (Tmux Plugin Manager)                               |
| **System**      | [asdf](https://asdf-vm.com/)                            | Manage runtimes for Node.js, Go, Python, and more                   |
| **Agent**       | [pi](https://github.com/earendil-works/pi-coding-agent) | AI coding assistant for the terminal                                |
| **Utilities**   | eza, bat, delta, fzf                                    | Modern replacements for standard Unix tools                         |

## 🚀 Quick Start

### 1. Prerequisites

Ensure you have [Homebrew](https://brew.sh/) and [GNU Stow](https://www.gnu.org/software/stow/) installed:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install stow
```

### 2. Installation

Clone the repository and use `stow` to symlink the configurations:

```bash
git clone https://github.com/matteo/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Install system dependencies
brew install ghostty starship zsh zoxide delta eza bat nvim fzf ripgrep tmux asdf

# Symlink configurations
stow .
```

### 3. Dependencies Handoff

Manual steps for plugins and runtimes:

**Zsh Plugins:**

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ~/.zsh/zsh-history-substring-search
```

**Tmux Plugin Manager (TPM):**

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Inside Tmux, press `Prefix + I` to install plugins
```

**Runtimes (asdf):**

```bash
asdf install nodejs latest
asdf install pnpm latest
asdf install python latest
asdf install golang latest
```

**Pi Coding Agent Extensions:**

```bash
pi add @juicesharp/rpiv-ask-user-question @juicesharp/rpiv-btw @aliou/pi-guardrails @plannotator/pi-extension amp-themes pi-subagents @tmustier/pi-usage-extension pi-simplify pi-ask-user pi-web-access
```
