#!/bin/bash

# ============================================================================
# DOTFILES INSTALLATION SCRIPT FOR UBUNTU
# Installs all dependencies and tools for the complete development environment
# Optimized for Ubuntu remote servers
# 
# Includes system tools matching your local setup:
# - git, curl, htop, zip/unzip
# - ripgrep (rg), fzf, bat (batcat), locate (plocate)
# - Plus development tools: neovim, tmux, zsh, node.js, python3, go, docker
# ============================================================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${BLUE}🚀 Starting dotfiles installation for Ubuntu...${NC}"
echo -e "${BLUE}📁 Dotfiles directory: ${DOTFILES_DIR}${NC}"

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install package using apt
install_package() {
    local package="$1"
    local name="${2:-$1}"
    
    echo -e "${YELLOW}📦 Installing ${name}...${NC}"
    sudo apt-get install -y "$package"
    echo -e "${GREEN}✅ ${name} installed successfully${NC}"
}

echo -e "${PURPLE}🔍 Checking system requirements...${NC}"

# Check if we're on Ubuntu
if ! command_exists apt-get; then
    echo -e "${RED}❌ This script is designed for Ubuntu systems only${NC}"
    exit 1
fi

# Check Ubuntu version
if [[ -f /etc/os-release ]]; then
    source /etc/os-release
    if [[ "$ID" == "ubuntu" ]]; then
        echo -e "${GREEN}✅ Ubuntu ${VERSION_ID} detected${NC}"
    else
        echo -e "${YELLOW}⚠️  Non-Ubuntu system detected, proceeding anyway...${NC}"
    fi
fi

echo -e "${BLUE}📋 Installing core dependencies...${NC}"

# Update package manager
echo -e "${YELLOW}🔄 Updating package lists...${NC}"
sudo apt-get update -qq

# Install essential packages
echo -e "${YELLOW}📦 Installing essential packages...${NC}"
sudo apt-get install -y curl wget git build-essential software-properties-common \
                       apt-transport-https ca-certificates gnupg lsb-release \
                       unzip zip tar gzip python3 python3-pip htop plocate

# Install additional core tools
echo -e "${YELLOW}📦 Installing additional core tools...${NC}"
sudo apt-get install -y zsh tmux

# Update plocate database for locate command
echo -e "${YELLOW}🔍 Updating plocate database...${NC}"
sudo updatedb || echo -e "${YELLOW}⚠️  plocate database update will run automatically${NC}"

# Install Zsh as default shell
if ! command_exists zsh; then
    echo -e "${RED}❌ Zsh installation failed${NC}"
    exit 1
fi

echo -e "${YELLOW}🐚 Setting Zsh as default shell...${NC}"
chsh -s $(which zsh)

echo -e "${BLUE}🔧 Installing development tools...${NC}"

# Install Neovim (latest stable)
if ! command_exists nvim; then
    echo -e "${YELLOW}🌟 Installing Neovim (latest stable)...${NC}"
    echo -e "${YELLOW}📥 Downloading Neovim binary (~10MB)...${NC}"
    curl -LO --progress-bar https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    echo -e "${YELLOW}📦 Extracting and installing...${NC}"
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    rm nvim-linux-x86_64.tar.gz
    
    # Add to PATH - check if already exists
    if ! grep -q "/opt/nvim-linux-x86_64/bin" ~/.profile; then
        echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"' >> ~/.profile
    fi
    
    # Make available in current session
    export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
    
    echo -e "${GREEN}✅ Neovim installed successfully${NC}"
    echo -e "${YELLOW}📝 Note: Restart your shell or run 'source ~/.profile' for PATH changes${NC}"
fi

# Install additional tools
echo -e "${BLUE}🛠️  Installing additional tools...${NC}"

# Install ripgrep (for telescope) - matches your rg setup
if ! command_exists rg; then
    install_package ripgrep "Ripgrep (rg)"
fi

# Install fd (for telescope)
if ! command_exists fd; then
    install_package fd-find "fd"
    # Create symlink for fd command
    sudo ln -sf /usr/bin/fdfind /usr/local/bin/fd 2>/dev/null || true
fi

# Install bat (for better file preview) - matches your batcat setup
if ! command_exists bat && ! command_exists batcat; then
    install_package bat "Bat"
fi
# Create symlink for bat command (Ubuntu uses batcat)
if command_exists batcat && ! command_exists bat; then
    sudo ln -sf /usr/bin/batcat /usr/local/bin/bat 2>/dev/null || true
    echo -e "${GREEN}✅ bat alias created for batcat${NC}"
fi

# Install lsd (modern ls replacement)
if ! command_exists lsd; then
    echo -e "${YELLOW}📂 Installing lsd...${NC}"
    LSD_VERSION="1.0.0"
    echo -e "${YELLOW}📥 Downloading lsd package...${NC}"
    wget --progress=bar:force "https://github.com/lsd-rs/lsd/releases/download/v${LSD_VERSION}/lsd_${LSD_VERSION}_amd64.deb" 2>&1 | sed 's/^/   /'
    echo -e "${YELLOW}📦 Installing lsd package...${NC}"
    sudo dpkg -i "lsd_${LSD_VERSION}_amd64.deb" || sudo apt-get install -f -y
    rm "lsd_${LSD_VERSION}_amd64.deb"
    echo -e "${GREEN}✅ lsd installed successfully${NC}"
fi

# Install fzf (fuzzy finder)
if ! command_exists fzf; then
    echo -e "${YELLOW}🔍 Installing fzf...${NC}"
    if [[ -d "$HOME/.fzf" ]]; then
        echo -e "${YELLOW}📁 fzf directory exists, updating...${NC}"
        cd "$HOME/.fzf" && git pull
    else
        echo -e "${YELLOW}📥 Cloning fzf repository...${NC}"
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    fi
    echo -e "${YELLOW}🔧 Installing fzf...${NC}"
    ~/.fzf/install --all
    echo -e "${GREEN}✅ fzf installed successfully${NC}"
fi

echo -e "${BLUE}🎨 Setting up shell environment...${NC}"

# Install Oh My Zsh
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo -e "${YELLOW}🐚 Installing Oh My Zsh...${NC}"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    echo -e "${GREEN}✅ Oh My Zsh installed successfully${NC}"
else
    echo -e "${GREEN}✅ Oh My Zsh already installed${NC}"
fi

# Install Powerlevel10k theme
if [[ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]]; then
    echo -e "${YELLOW}⚡ Installing Powerlevel10k theme...${NC}"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
        "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
    echo -e "${GREEN}✅ Powerlevel10k installed successfully${NC}"
else
    echo -e "${GREEN}✅ Powerlevel10k already installed${NC}"
fi

# Install Zsh plugins
echo -e "${BLUE}🔌 Installing Zsh plugins...${NC}"

# zsh-autosuggestions
if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]]; then
    echo -e "${YELLOW}📦 Installing zsh-autosuggestions...${NC}"
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
else
    echo -e "${GREEN}✅ zsh-autosuggestions already installed${NC}"
fi

# zsh-syntax-highlighting
if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]]; then
    echo -e "${YELLOW}📦 Installing zsh-syntax-highlighting...${NC}"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
else
    echo -e "${GREEN}✅ zsh-syntax-highlighting already installed${NC}"
fi

# zsh-completions
if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]]; then
    echo -e "${YELLOW}📦 Installing zsh-completions...${NC}"
    git clone https://github.com/zsh-users/zsh-completions \
        "$HOME/.oh-my-zsh/custom/plugins/zsh-completions"
else
    echo -e "${GREEN}✅ zsh-completions already installed${NC}"
fi

echo -e "${GREEN}✅ Zsh plugins installation completed${NC}"

echo -e "${BLUE}🔧 Setting up Tmux...${NC}"

# Install Tmux Plugin Manager
if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    echo -e "${YELLOW}📦 Installing Tmux Plugin Manager...${NC}"
    mkdir -p "$HOME/.tmux/plugins"
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    echo -e "${GREEN}✅ Tmux Plugin Manager installed successfully${NC}"
else
    echo -e "${GREEN}✅ Tmux Plugin Manager already installed${NC}"
fi

echo -e "${BLUE}🌟 Setting up Neovim...${NC}"

# Install Node.js and npm (required for some nvim plugins)
if ! command_exists node; then
    echo -e "${YELLOW}📦 Installing Node.js...${NC}"
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
    echo -e "${GREEN}✅ Node.js installed successfully${NC}"
fi

# Install Python3 and pip3 (required for some nvim plugins)
if ! command_exists python3; then
    install_package python3 "Python3"
fi

if ! command_exists pip3; then
    install_package python3-pip "Python3 pip"
fi

# Install global npm packages for nvim plugins
echo -e "${YELLOW}📦 Installing global npm packages...${NC}"
if sudo npm install -g swagger-ui-watcher neovim; then
    echo -e "${GREEN}✅ Global npm packages installed successfully${NC}"
else
    echo -e "${YELLOW}⚠️  npm package installation failed, continuing...${NC}"
fi

echo -e "${BLUE}🔤 Installing fonts...${NC}"

# Install Nerd Fonts
if [[ ! -d "$HOME/.local/share/fonts" ]]; then
    mkdir -p "$HOME/.local/share/fonts"
fi

if [[ ! -f "$HOME/.local/share/fonts/JetBrainsMono Nerd Font Complete.ttf" ]]; then
    echo -e "${YELLOW}🔤 Installing JetBrains Mono Nerd Font...${NC}"
    echo -e "${YELLOW}📥 Downloading font package (~15MB)...${NC}"
    if wget --progress=bar:force "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip" 2>&1 | sed 's/^/   /'; then
        echo -e "${YELLOW}📦 Extracting fonts...${NC}"
        unzip -q JetBrainsMono.zip -d "$HOME/.local/share/fonts/"
        rm JetBrainsMono.zip
        echo -e "${YELLOW}🔄 Refreshing font cache...${NC}"
        fc-cache -fv >/dev/null 2>&1
        echo -e "${GREEN}✅ JetBrains Mono Nerd Font installed successfully${NC}"
    else
        echo -e "${YELLOW}⚠️  Font download failed, continuing...${NC}"
    fi
else
    echo -e "${GREEN}✅ JetBrains Mono Nerd Font already installed${NC}"
fi

echo -e "${BLUE}🐹 Installing Go (optional)...${NC}"

# Install Go
if ! command_exists go; then
    echo -e "${YELLOW}🐹 Installing Go...${NC}"
    GO_VERSION="1.21.6"
    echo -e "${YELLOW}📥 Downloading Go ${GO_VERSION} (~130MB)...${NC}"
    if wget --progress=bar:force "https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz" 2>&1 | sed 's/^/   /'; then
        echo -e "${YELLOW}📦 Installing Go...${NC}"
        sudo tar -C /usr/local -xzf "go${GO_VERSION}.linux-amd64.tar.gz"
        rm "go${GO_VERSION}.linux-amd64.tar.gz"
        echo 'export PATH=$PATH:/usr/local/go/bin' >> "$HOME/.profile"
        echo -e "${GREEN}✅ Go installed successfully${NC}"
    else
        echo -e "${YELLOW}⚠️  Go download failed, continuing...${NC}"
    fi
else
    echo -e "${GREEN}✅ Go already installed${NC}"
fi

echo -e "${BLUE}🐋 Installing Docker (optional)...${NC}"

# Install Docker
if ! command_exists docker; then
    echo -e "${YELLOW}🐋 Installing Docker...${NC}"
    if curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh; then
        sudo usermod -aG docker "$USER"
        rm get-docker.sh
        echo -e "${GREEN}✅ Docker installed successfully${NC}"
        echo -e "${YELLOW}⚠️  Please log out and log back in for Docker permissions to take effect${NC}"
    else
        echo -e "${YELLOW}⚠️  Docker installation failed, continuing...${NC}"
        rm -f get-docker.sh
    fi
else
    echo -e "${GREEN}✅ Docker already installed${NC}"
fi

echo -e "${GREEN}🎉 Installation complete!${NC}"
echo -e "${BLUE}📝 Next steps:${NC}"
echo -e "   1. Run ./bootstrap.sh to symlink configurations"
echo -e "   2. Restart your terminal or run: exec zsh"
echo -e "   3. Open tmux and install plugins: tmux then Ctrl+b + I"
echo -e "   4. Open nvim and install plugins: nvim then :Lazy sync"
echo -e "   5. Configure your terminal to use JetBrains Mono Nerd Font"
echo -e "${BLUE}✨ Enjoy your new development environment!${NC}"
echo -e "${CYAN}💡 Thanks, Nikhil for the help with this script!${NC}"
