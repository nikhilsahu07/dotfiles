# 📋 Setup Guide

> Complete installation and configuration guide for the Professional Development Environment Dotfiles.

## 🚀 Quick Installation

### Prerequisites

- Ubuntu 20.04+ or compatible Linux distribution
- Terminal with 256-color support
- Internet connection for downloads
- sudo privileges for package installation

### One-Command Setup

```bash
# Clone and install everything
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles && \
cd ~/.dotfiles && \
./install.sh && \
./bootstrap.sh && \
exec zsh
```

## 📖 Detailed Installation

### 1. Clone the Repository

```bash
# Clone to your home directory
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### 2. Install Dependencies

```bash
# Run the installation script
./install.sh
```

**This script will install:**

- **System packages**: curl, wget, git, build-essential, htop, zip/unzip
- **Neovim** (v0.11.2+): Downloaded as AppImage for latest version
- **Tmux**: Terminal multiplexer with plugin manager
- **Zsh**: Modern shell with Oh My Zsh framework
- **Powerlevel10k**: Ultra-fast prompt theme
- **Modern CLI tools**: lsd, bat, fd, ripgrep, fzf, fastfetch
- **Development tools**: Node.js, Python3, Go, Docker (optional)
- **Fonts**: JetBrains Mono Nerd Font
- **GitHub CLI**: For git workflow management

### 3. Link Configurations

```bash
# Create symbolic links for all configurations
./bootstrap.sh
```

**This will create symlinks for:**

- `~/.config/nvim` → `~/.dotfiles/nvim`
- `~/.tmux.conf` → `~/.dotfiles/tmux/.tmux.conf`
- `~/.zshrc` → `~/.dotfiles/zsh/.zshrc`
- `~/.p10k.zsh` → `~/.dotfiles/zsh/.p10k.zsh`
- `~/.gitconfig` → `~/.dotfiles/git/.gitconfig`

### 4. Complete Setup

```bash
# Restart your terminal or reload shell
exec zsh

# The prompt will guide you through Powerlevel10k configuration
# Choose your preferred style (recommend: Rainbow, Unicode, 24h time, 2 lines)
```

### 5. Install Plugin Dependencies

#### Tmux Plugins

```bash
# Start tmux
tmux

# Install plugins with TPM (Tmux Plugin Manager)
# Press: Ctrl+b + I (capital i)
# Wait for installation to complete
```

#### Neovim Plugins

```bash
# Open Neovim
nvim

# Install all plugins
:Lazy sync

# Wait for all plugins to install
# May take 2-3 minutes on first run
```

## 🔧 Configuration Details

### System Requirements

- **OS**: Ubuntu 20.04+, Debian 11+, or compatible
- **Memory**: 2GB RAM minimum (4GB recommended)
- **Storage**: 500MB free space for tools and fonts
- **Network**: Required for initial setup and plugin installation

### Installed Components

#### Core Tools

| Tool   | Version  | Purpose              |
| ------ | -------- | -------------------- |
| Neovim | v0.11.2+ | Modern text editor   |
| Tmux   | 3.0+     | Terminal multiplexer |
| Zsh    | 5.8+     | Advanced shell       |
| Git    | 2.34+    | Version control      |

#### Shell Enhancements

| Tool                    | Purpose                   |
| ----------------------- | ------------------------- |
| Oh My Zsh               | Zsh framework             |
| Powerlevel10k           | Fast, customizable prompt |
| zsh-autosuggestions     | Command suggestions       |
| zsh-syntax-highlighting | Command highlighting      |
| zsh-completions         | Enhanced completions      |

#### Modern CLI Tools

| Tool      | Purpose                             | Alternative to |
| --------- | ----------------------------------- | -------------- |
| lsd       | Modern ls with icons                | ls             |
| bat       | Better cat with syntax highlighting | cat            |
| fd        | Better find command                 | find           |
| ripgrep   | Fast text search                    | grep           |
| fzf       | Fuzzy finder                        | -              |
| fastfetch | System information                  | neofetch       |

#### Development Tools

| Tool       | Purpose                   |
| ---------- | ------------------------- |
| Node.js    | JavaScript runtime        |
| Python3    | Python interpreter        |
| Go         | Go programming language   |
| Docker     | Container platform        |
| GitHub CLI | Git repository management |

### Font Configuration

The **JetBrains Mono Nerd Font** is automatically installed and provides:

- Programming-optimized character spacing
- Full Nerd Font icon support
- Excellent readability for coding
- Consistent appearance across all tools

## 🎨 Customization

### Changing Themes

#### Neovim Theme

```lua
-- Edit: ~/.config/nvim/lua/core/plugin_config/colorscheme.lua
vim.cmd.colorscheme("catppuccin-mocha")  -- Change to your preferred theme
```

#### Tmux Theme

```bash
# Edit: ~/.tmux.conf
set -g @catppuccin_flavor "mocha"  # Options: latte, frappe, macchiato, mocha
```

#### Zsh Prompt Theme

```bash
# Reconfigure Powerlevel10k
p10k configure

# Or edit directly: ~/.p10k.zsh
```

### Adding Plugins

#### Neovim Plugins

```lua
-- Edit: ~/.config/nvim/lua/core/plugins.lua
return {
  -- Add your plugins here
  "author/plugin-name",
  {
    "author/plugin-name",
    config = function()
      -- Plugin configuration
    end,
  },
}
```

#### Tmux Plugins

```bash
# Edit: ~/.tmux.conf
set -g @plugin 'author/plugin-name'
# Then press Ctrl+b + I to install
```

#### Zsh Plugins

```bash
# Edit: ~/.zshrc
plugins=(
  git
  golang
  docker
  # Add your plugins here
  your-plugin-name
)
```

### Custom Key Mappings

#### Neovim

```lua
-- Edit: ~/.config/nvim/lua/core/keymaps.lua
vim.keymap.set('n', '<leader>custom', ':YourCommand<CR>', { desc = 'Your custom command' })
```

#### Tmux

```bash
# Edit: ~/.tmux.conf
bind-key c-custom new-window -n 'custom'
```

### Personal Git Configuration

```bash
# Edit: ~/.gitconfig
[user]
    name = Your Name
    email = your.email@example.com
```

## 🛠️ Troubleshooting

### Common Issues

#### Neovim Issues

**Plugins not loading**

```bash
# Check Lazy.nvim status
nvim
:Lazy

# Clean and reinstall plugins
:Lazy clean
:Lazy sync
```

**LSP not working**

```bash
# Check Mason status
nvim
:Mason

# Install language servers manually
:MasonInstall lua-language-server typescript-language-server
:LspInfo  # Check LSP status
```

**Copilot not working**

```bash
# Setup Copilot authentication
nvim
:Copilot setup
:Copilot auth
```

#### Tmux Issues

**Plugins not loading**

```bash
# Reinstall TPM
rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Reload tmux config
tmux source ~/.tmux.conf
# Then press Ctrl+b + I
```

**Theme not applying**

```bash
# Check if plugin is installed
tmux list-keys | grep catppuccin

# Reload configuration
tmux source ~/.tmux.conf
```

#### Zsh Issues

**Prompt not showing**

```bash
# Reconfigure Powerlevel10k
p10k configure

# Check if theme is installed
ls ~/.oh-my-zsh/custom/themes/powerlevel10k
```

**Autosuggestions not working**

```bash
# Check if plugin is installed
ls ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Reload configuration
source ~/.zshrc
```

#### Font Issues

**Icons not displaying**

```bash
# Install Nerd Fonts manually
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip JetBrainsMono.zip -d ~/.local/share/fonts/
fc-cache -fv

# Set terminal font to "JetBrainsMono Nerd Font"
```

### Performance Issues

**Slow shell startup**

```bash
# Profile zsh startup time
zsh -i -c 'zprof'

# Disable unused plugins in ~/.zshrc
plugins=(
  git
  # Remove unused plugins
)
```

**High memory usage**

```bash
# Check running processes
htop

# Reduce Neovim plugin load
# Edit ~/.config/nvim/lua/core/plugins.lua
```

### Network Issues

**Downloads failing**

```bash
# Check internet connection
ping google.com

# Use alternative mirrors
# Edit install.sh and change download URLs
```

## 🔄 Updating

### Update Dotfiles

```bash
cd ~/.dotfiles
git pull origin main
./bootstrap.sh  # Re-link configurations
```

### Update Plugins

#### Neovim

```bash
nvim
:Lazy update
```

#### Tmux

```bash
# In tmux: Ctrl+b + U
```

#### Zsh

```bash
# Update Oh My Zsh
omz update

# Update plugins
cd ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git pull origin master
```

### Update System Tools

```bash
# Update all system packages
sudo apt update && sudo apt upgrade

# Update Node.js
sudo npm install -g n
sudo n latest

# Update Go
# Download latest from https://golang.org/dl/
```

## 🔐 Security Considerations

### SSH Key Management

```bash
# Generate SSH key for GitHub
ssh-keygen -t ed25519 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Add to GitHub: https://github.com/settings/keys
```

### Git Configuration

```bash
# Configure GPG signing (optional)
git config --global user.signingkey YOUR_KEY_ID
git config --global commit.gpgsign true
```

## 📁 Backup & Restore

### Backup Current Configuration

```bash
# The bootstrap script automatically creates backups
ls -la ~/ | grep backup

# Manual backup
cp -r ~/.config/nvim ~/.config/nvim.backup
cp ~/.zshrc ~/.zshrc.backup
cp ~/.tmux.conf ~/.tmux.conf.backup
```

### Restore from Backup

```bash
# Restore individual configurations
mv ~/.config/nvim.backup ~/.config/nvim
mv ~/.zshrc.backup ~/.zshrc
mv ~/.tmux.conf.backup ~/.tmux.conf
```

## 🌟 Pro Tips

### Productivity Enhancements

1. **Learn the key bindings** - See [macros.md](macros.md) for all shortcuts
2. **Use fuzzy finder** - `Ctrl+R` for command history, `Ctrl+P` for files
3. **Master tmux sessions** - `tmux new -s work` for project-specific sessions
4. **Leverage LSP features** - `gd` for definitions, `gr` for references
5. **Use git aliases** - `gst` for status, `gco` for checkout

### Advanced Configuration

1. **Create project-specific settings** - Use `.nvimrc` for project configurations
2. **Set up remote development** - Use SSH with forwarded keys
3. **Configure multiple git identities** - Use conditional includes in `.gitconfig`
4. **Optimize for your workflow** - Customize key mappings and aliases

## 📞 Support

For additional help:

- Check the [main README](README.md) for overview
- Reference [macros.md](macros.md) for all key bindings
- Search existing issues in the repository
- Create a new issue with detailed information

---

**Happy coding! 🚀**
