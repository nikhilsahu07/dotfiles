#!/bin/bash

# ============================================================================
# DOTFILES BOOTSTRAP SCRIPT
# Symlinks all configuration files to their proper locations
# ============================================================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${BLUE}🚀 Starting dotfiles bootstrap...${NC}"
echo -e "${BLUE}📁 Dotfiles directory: ${DOTFILES_DIR}${NC}"

# Function to create symlink with backup
create_symlink() {
    local src="$1"
    local dest="$2"
    local name="$3"
    
    echo -e "${YELLOW}🔗 Setting up ${name}...${NC}"
    
    # Create destination directory if it doesn't exist
    mkdir -p "$(dirname "$dest")"
    
    # Backup existing file/directory
    if [[ -e "$dest" && ! -L "$dest" ]]; then
        echo -e "${YELLOW}📦 Backing up existing ${name} to ${dest}.backup${NC}"
        mv "$dest" "${dest}.backup"
    elif [[ -L "$dest" ]]; then
        echo -e "${YELLOW}🔄 Removing existing symlink for ${name}${NC}"
        rm "$dest"
    fi
    
    # Create symlink
    ln -sf "$src" "$dest"
    echo -e "${GREEN}✅ ${name} linked successfully${NC}"
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

echo -e "${BLUE}📋 Setting up configuration symlinks...${NC}"

# Neovim configuration
create_symlink "$DOTFILES_DIR/nvim" "$HOME/.config/nvim" "Neovim config"

# Tmux configuration
create_symlink "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf" "Tmux config"

# Zsh configuration
create_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc" "Zsh config"
create_symlink "$DOTFILES_DIR/zsh/.p10k.zsh" "$HOME/.p10k.zsh" "Powerlevel10k config"

# Git configuration
create_symlink "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig" "Git config"

echo -e "${GREEN}✅ All configuration files linked successfully!${NC}"

# Check if Oh My Zsh is installed
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo -e "${YELLOW}⚠️  Oh My Zsh not found. Please run install.sh first.${NC}"
fi

# Check if Tmux Plugin Manager is installed
if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    echo -e "${YELLOW}⚠️  Tmux Plugin Manager not found. Please run install.sh first.${NC}"
fi

echo -e "${BLUE}🔄 Reloading shell configuration...${NC}"

# Source zsh configuration if we're in zsh
if [[ "$SHELL" == *"zsh"* ]]; then
    echo -e "${BLUE}🐚 Sourcing zsh configuration...${NC}"
    # Note: This won't work in the script, user needs to restart shell or source manually
    echo -e "${YELLOW}📝 Please restart your shell or run: source ~/.zshrc${NC}"
fi

echo -e "${GREEN}🎉 Bootstrap complete!${NC}"
echo -e "${BLUE}📝 Next steps:${NC}"
echo -e "   1. Restart your terminal"
echo -e "   2. Run 'tmux source ~/.tmux.conf' to reload tmux config"
echo -e "   3. Open nvim and run ':Lazy sync' to install plugins"
echo -e "   4. For tmux plugins, press prefix + I (Ctrl+b + I) to install"
echo -e "${BLUE}✨ Enjoy your synchronized development environment!${NC}" 