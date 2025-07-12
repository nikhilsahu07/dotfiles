# 🚀 Ultimate Development Environment Dotfiles

> A comprehensive, modular dotfiles setup for the ultimate development experience with Neovim, Tmux, Zsh, and more.

## ✨ Features

### 🌟 **Neovim v0.11.2 Configuration**

- **Modern Plugin Management**: Lazy.nvim for fast plugin loading
- **LSP Support**: Full Language Server Protocol integration with Mason
- **GitHub Copilot**: AI-powered code completion
- **Telescope**: Fuzzy finder for files, buffers, and more
- **Treesitter**: Advanced syntax highlighting and code parsing
- **Git Integration**: Gitsigns for git hunks and fugitive for git operations
- **Terminal Integration**: Toggleterm for VSCode-like terminal experience
- **File Management**: Oil and NvimTree for file exploration
- **Debugging**: DAP (Debug Adapter Protocol) support
- **Markdown/Swagger**: Preview support for documentation

### 🎨 **Beautiful Terminal Experience**

- **Zsh + Oh My Zsh**: Enhanced shell with powerful plugins
- **Powerlevel10k**: Lightning-fast, customizable prompt
- **Catppuccin Theme**: Consistent theming across all tools
- **Modern File Listing**: lsd with icons and colors
- **Smart Autocompletion**: Zsh autosuggestions and syntax highlighting
- **Fuzzy Finding**: fzf integration for everything

### 🔧 **Tmux Configuration**

- **Catppuccin Theme**: Beautiful, consistent styling
- **Vim-like Navigation**: Seamless pane switching
- **Plugin Management**: TPM (Tmux Plugin Manager)
- **Status Bar**: Custom status modules with directory and session info
- **Mouse Support**: Modern mouse integration

### 🛠️ **Development Tools**

- **Multiple Language Support**: Go, Python, JavaScript, TypeScript, and more
- **Docker Integration**: Container development support
- **Git Workflow**: Enhanced git aliases and tools
- **Modern CLI Tools**: bat, fd, ripgrep, and more

## 📦 What's Included

```
dotfiles/
├── 📁 nvim/                    # Neovim configuration
│   ├── init.lua               # Main entry point
│   ├── lazy-lock.json         # Plugin lockfile
│   └── lua/                   # Lua configuration modules
│       └── core/              # Core configuration
│           ├── options.lua    # Vim options
│           ├── keymaps.lua    # Key mappings
│           ├── plugins.lua    # Plugin definitions
│           └── plugin_config/ # Plugin configurations
├── 📁 tmux/                   # Tmux configuration
│   └── .tmux.conf             # Tmux settings
├── 📁 zsh/                    # Zsh configuration
│   ├── .zshrc                 # Zsh settings
│   └── .p10k.zsh              # Powerlevel10k theme
├── 📁 git/                    # Git configuration
│   └── .gitconfig             # Git settings
├── 🚀 install.sh              # Dependency installation script
├── 🔗 bootstrap.sh            # Configuration linking script
└── 📖 README.md               # This file
```

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### 2. Install Dependencies

```bash
./install.sh
```

This will install:

- **Neovim v0.11.2** - Latest stable version
- **Tmux** - Terminal multiplexer
- **Zsh** - Modern shell
- **Oh My Zsh** - Zsh framework
- **Powerlevel10k** - Beautiful prompt
- **Modern CLI Tools** - bat, fd, ripgrep, lsd, fzf
- **Development Tools** - Node.js, Python3, Go, Docker
- **Fonts** - JetBrains Mono Nerd Font

### 3. Link Configurations

```bash
./bootstrap.sh
```

This will create symlinks for all configuration files to their proper locations.

### 4. Complete Setup

```bash
# Restart your terminal or
exec zsh

# Start tmux and install plugins
tmux
# Press Ctrl+b + I to install tmux plugins

# Open Neovim and install plugins
nvim
# Run :Lazy sync to install all plugins
```

## 🎯 Usage Guide

### 🌟 **Neovim**

#### Key Mappings

- **Leader Key**: `Space`
- **Find Files**: `Ctrl+P`
- **Command Palette**: `Ctrl+Shift+P`
- **Terminal Toggle**: `Ctrl+J`
- **Navigate Panes**: `Ctrl+H/K/L`
- **Clear Highlights**: `Leader+H`

#### GitHub Copilot

- **Accept Suggestion**: `Tab`
- **Accept Word**: `Ctrl+Right`
- **Accept Line**: `Ctrl+Down`
- **Next Suggestion**: `Alt+]`
- **Previous Suggestion**: `Alt+[`
- **Toggle Copilot**: `Ctrl+I`
- **Help**: `Leader+CH`

#### LSP Features

- **Go to Definition**: `gd`
- **Go to References**: `gr`
- **Hover Documentation**: `K`
- **Code Actions**: `Leader+CA`
- **Rename**: `Leader+RN`
- **Format**: `Leader+F`

### 🔧 **Tmux**

- **Prefix**: `Ctrl+B`
- **New Window**: `Prefix+C`
- **Switch Windows**: `Prefix+1-9`
- **Split Horizontal**: `Prefix+%`
- **Split Vertical**: `Prefix+"`
- **Navigate Panes**: `Prefix+H/J/K/L`
- **Reload Config**: `Prefix+R`

### 🐚 **Zsh**

- **Enhanced `ls`**: `ll`, `la`, `l`, `tree`
- **Git Shortcuts**: `gst`, `gco`, `gp`, `gl`
- **Directory Navigation**: `..`, `...`, `....`
- **Create & Enter**: `mkcd <dir>`
- **Extract Archives**: `extract <file>`
- **Quick Find**: `qfind <pattern>`

## 🎨 Customization

### 🌈 **Changing Themes**

The configuration uses **Catppuccin Mocha** theme consistently across all tools. To change themes:

1. **Neovim**: Edit `lua/core/plugin_config/colorscheme.lua`
2. **Tmux**: Edit `tmux/.tmux.conf` and change `@catppuccin_flavor`
3. **Zsh**: Edit `zsh/.p10k.zsh` for prompt colors

### 🔧 **Adding Plugins**

- **Neovim**: Add to `lua/core/plugins.lua`
- **Tmux**: Add to `tmux/.tmux.conf`
- **Zsh**: Add to `zsh/.zshrc` plugins array

### ⌨️ **Custom Key Mappings**

- **Neovim**: Edit `lua/core/keymaps.lua`
- **Tmux**: Edit `tmux/.tmux.conf`

## 🛠️ Troubleshooting

### Common Issues

#### Neovim Plugins Not Loading

```bash
# Open Neovim and run:
:Lazy sync
:Lazy clean
:Lazy update
```

#### Tmux Plugins Not Working

```bash
# Install TPM first:
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Then in tmux: Ctrl+b + I
```

#### Zsh Not Loading Properly

```bash
# Source the configuration:
source ~/.zshrc
# Or reinstall Oh My Zsh:
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### Font Issues

```bash
# Install Nerd Fonts:
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip JetBrainsMono.zip -d ~/.local/share/fonts/
fc-cache -fv
```

### LSP Issues

```bash
# Open Neovim and run:
:Mason
# Install language servers manually
:LspInfo
# Check LSP status
```

## 📋 Requirements

- **OS**: Ubuntu 20.04+, macOS 10.15+, or compatible Linux distribution
- **Terminal**: Any terminal with 256-color support
- **Internet**: Required for initial setup and plugin installation
- **Permissions**: sudo access for package installation

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Neovim](https://neovim.io/) - The hyperextensible Vim-based text editor
- [Tmux](https://github.com/tmux/tmux) - Terminal multiplexer
- [Oh My Zsh](https://ohmyz.sh/) - Framework for managing Zsh configuration
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) - Fast and customizable prompt
- [Catppuccin](https://github.com/catppuccin/catppuccin) - Beautiful color scheme
- [Lazy.nvim](https://github.com/folke/lazy.nvim) - Modern plugin manager for Neovim

## 📞 Support

If you encounter any issues or have questions:

1. Check the [Troubleshooting](#-troubleshooting) section
2. Search existing issues in the repository
3. Create a new issue with detailed information
4. Join the discussion in the repository

---

<div align="center">

**⭐ Star this repository if it helped you! ⭐**

Made with ❤️ for the developer community

</div>
