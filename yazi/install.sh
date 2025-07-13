#!/bin/bash

# Yazi Setup Script for Ubuntu 22.04 Jammy
# Lightweight configuration with Catppuccin Mocha theme

set -e

echo "🎨 Setting up Yazi with Catppuccin Mocha theme..."

# Check if running on Ubuntu 22.04
if [[ ! -f /etc/os-release ]] || ! grep -q "jammy" /etc/os-release; then
    echo "⚠️  This script is designed for Ubuntu 22.04 Jammy"
    echo "Continuing anyway..."
fi

# Install dependencies
echo "📦 Installing dependencies..."
sudo apt update

# Install required packages
PACKAGES=(
    "curl"
    "wget"
    "unzip"
    "fd-find"
    "file"
    "ffmpeg"
    "imagemagick"
    "jq"
    "poppler-utils"
    "unar"
    "xdg-utils"
)

for pkg in "${PACKAGES[@]}"; do
    if ! dpkg -l | grep -q "^ii  $pkg"; then
        echo "Installing $pkg..."
        sudo apt install -y "$pkg"
    else
        echo "✓ $pkg already installed"
    fi
done

# Create fd symlink if it doesn't exist
if ! command -v fd &> /dev/null; then
    if command -v fdfind &> /dev/null; then
        echo "Creating fd symlink..."
        sudo ln -sf /usr/bin/fdfind /usr/local/bin/fd
    fi
fi

# Install Yazi
echo "🚀 Installing Yazi..."
if ! command -v yazi &> /dev/null; then
    # Download and install Yazi
    YAZI_VERSION=$(curl -s https://api.github.com/repos/sxyazi/yazi/releases/latest | jq -r '.tag_name')
    echo "Installing Yazi $YAZI_VERSION..."
    
    cd /tmp
    curl -L "https://github.com/sxyazi/yazi/releases/download/$YAZI_VERSION/yazi-x86_64-unknown-linux-gnu.zip" -o yazi.zip
    unzip yazi.zip
    sudo cp yazi-x86_64-unknown-linux-gnu/yazi /usr/local/bin/
    sudo cp yazi-x86_64-unknown-linux-gnu/ya /usr/local/bin/
    sudo chmod +x /usr/local/bin/yazi /usr/local/bin/ya
    rm -rf yazi.zip yazi-x86_64-unknown-linux-gnu
    
    echo "✓ Yazi installed successfully"
else
    echo "✓ Yazi already installed"
fi

# Install JetBrains Mono Nerd Font
echo "🔤 Installing JetBrains Mono Nerd Font..."
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

if [[ ! -f "$FONT_DIR/JetBrainsMono-Regular.ttf" ]]; then
    cd /tmp
    curl -L "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip" -o JetBrainsMono.zip
    unzip JetBrainsMono.zip -d JetBrainsMono
    cp JetBrainsMono/*.ttf "$FONT_DIR/"
    rm -rf JetBrainsMono.zip JetBrainsMono
    fc-cache -fv
    echo "✓ JetBrains Mono Nerd Font installed"
else
    echo "✓ JetBrains Mono Nerd Font already installed"
fi

# Verify required tools
echo "🔍 Verifying required tools..."
REQUIRED_TOOLS=("fzf" "rg" "bat" "yazi" "fd")
MISSING_TOOLS=()

for tool in "${REQUIRED_TOOLS[@]}"; do
    if ! command -v "$tool" &> /dev/null; then
        MISSING_TOOLS+=("$tool")
    fi
done

if [[ ${#MISSING_TOOLS[@]} -gt 0 ]]; then
    echo "⚠️  Missing tools: ${MISSING_TOOLS[*]}"
    echo "Please install them manually:"
    for tool in "${MISSING_TOOLS[@]}"; do
        case "$tool" in
            "fzf")
                echo "  - fzf: sudo apt install fzf"
                ;;
            "rg")
                echo "  - ripgrep: sudo apt install ripgrep"
                ;;
            "bat")
                echo "  - bat: sudo apt install bat"
                ;;
            "fd")
                echo "  - fd: sudo apt install fd-find"
                ;;
        esac
    done
    echo ""
fi

# Create config directory
echo "📁 Setting up configuration..."
mkdir -p ~/.config/yazi

# Check if configuration files exist
CONFIG_FILES=("yazi.toml" "theme.toml" "keymap.toml")
for file in "${CONFIG_FILES[@]}"; do
    if [[ -f "~/.config/yazi/$file" ]]; then
        echo "✓ $file configuration found"
    else
        echo "⚠️  $file configuration not found"
    fi
done

# Test yazi
echo "🧪 Testing Yazi..."
if command -v yazi &> /dev/null; then
    echo "✓ Yazi is working"
    echo "Run 'yazi --help' to see available options"
else
    echo "❌ Yazi installation failed"
    exit 1
fi

echo ""
echo "🎉 Yazi setup complete!"
echo ""
echo "🚀 Quick start:"
echo "  - Run 'yazi' or 'y' to start the file manager"
echo "  - Press '~' inside yazi to see all keybindings"
echo "  - Use Ctrl+f for fzf file search"
echo "  - Use Ctrl+g for ripgrep content search"
echo "  - Press 'I' to view files with bat"
echo ""
echo "🎨 Theme: Catppuccin Mocha (matches your nvim/tmux setup)"
echo "🔤 Font: JetBrains Mono Nerd Font"
echo "⚡ Integrated with: fzf, ripgrep, bat"
echo ""
echo "Happy file managing! 🗂️" 