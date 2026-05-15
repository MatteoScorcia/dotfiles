# 🍄 matteo's dotfiles

A minimalist, aesthetic, and highly productive development environment themed with **Catppuccin Macchiato**. Optimized for macOS (Darwin) but adaptable for Linux.

## 📸 Preview

_(Insert a beautiful screenshot of Ghostty + Neovim + Tmux + Starship here)_

## 🛠️ The Stack

| Category        | Tool                                 | Description                                                         |
| :-------------- | :----------------------------------- | :------------------------------------------------------------------ |
| **Terminal**    | [Ghostty](https://ghostty.org/)      | Fast, native renderer with modern features                          |
| **Shell**       | [Zsh](https://www.zsh.org/)          | Enhanced with Starship, Autosuggestions, and Zoxide                 |
| **Editor**      | [Neovim](https://neovim.io/)         | [LazyVim](https://www.lazyvim.org/) distribution with custom tweaks |
| **Multiplexer** | [Tmux](https://github.com/tmux/tmux) | Managed via TPM (Tmux Plugin Manager)                               |
| **System**      | [asdf](https://asdf-vm.com/)         | Manage runtimes for Node.js, Go, Python, and more                   |
| **Utilities**   | eza, bat, delta, fzf                 | Modern replacements for standard Unix tools                         |

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

## ⌨️ Key Highlights

- **Aliases**: `vim` → `nvim`, `ls` → `eza`, `pn` → `pnpm`.
- **Zsh**: Integrated with `zoxide` (`cd` on steroids) and `fzf`.
- **Tmux**: Prefix is bound to `Ctrl + a`. Catppuccin Macchiato status bar on top.
- **Git**: Configured with `delta` for beautiful, side-by-side diffs.
