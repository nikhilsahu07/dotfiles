#!/bin/bash

# Yazi Setup Script for Ubuntu 22.04 Jammy
# Source build with minimal tools and Catppuccin Mocha theme

set -e

echo "🎨 Setting up Yazi with Catppuccin Mocha theme..."

# Check if running on Ubuntu 22.04
if [[ ! -f /etc/os-release ]] || ! grep -q "jammy" /etc/os-release; then
    echo "⚠️  This script is designed for Ubuntu 22.04 Jammy"
    echo "Continuing anyway..."
fi

# 🔧 Install build dependencies
echo "📦 Installing build dependencies..."
sudo apt update
sudo apt install -y build-essential curl git unzip

# Install Rust toolchain
echo "🦀 Installing Rust toolchain..."
if ! command -v rustc &> /dev/null; then
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    source "$HOME/.cargo/env"
    echo "✓ Rust toolchain installed"
else
    echo "✓ Rust toolchain already installed"
    source "$HOME/.cargo/env"
fi

# Clone and build Yazi
echo "🚀 Building Yazi from source..."
if ! command -v yazi &> /dev/null; then
    cd /tmp
    if [[ -d "yazi" ]]; then
        rm -rf yazi
    fi
    
    echo "Cloning Yazi repository..."
    git clone https://github.com/sxyazi/yazi
    cd yazi
    
    echo "Building Yazi (this may take a few minutes)..."
    cargo build --release
    
    echo "Installing Yazi binaries..."
    sudo cp target/release/yazi /usr/local/bin/
    sudo cp target/release/ya /usr/local/bin/
    sudo chmod +x /usr/local/bin/yazi /usr/local/bin/ya
    
    cd ..
    rm -rf yazi
    echo "✓ Yazi built and installed successfully"
else
    echo "✓ Yazi already installed"
fi

# 🧩 Install minimal preview tools
echo "🔧 Installing minimal preview tools..."
MINIMAL_TOOLS=(
    "bat"
    "fd-find"
    "ripgrep"
    "jq"
    "imagemagick"
)

for tool in "${MINIMAL_TOOLS[@]}"; do
    if ! dpkg -l | grep -q "^ii  $tool"; then
        echo "Installing $tool..."
        sudo apt install -y "$tool"
    else
        echo "✓ $tool already installed"
    fi
done

# Create fd symlink if it doesn't exist
if ! command -v fd &> /dev/null; then
    if command -v fdfind &> /dev/null; then
        echo "Creating fd symlink..."
        sudo ln -sf /usr/bin/fdfind /usr/local/bin/fd
    fi
fi

# 🎨 Optional: Install viu for inline image previews
echo "🖼️ Installing viu for inline image previews..."
if ! command -v viu &> /dev/null; then
    echo "Installing viu via cargo..."
    cargo install viu
    echo "✓ viu installed successfully"
else
    echo "✓ viu already installed"
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

# 🎨 Add Catppuccin Theme
echo "🎨 Setting up Catppuccin theme..."
mkdir -p ~/.config/yazi/themes
if [[ ! -d ~/.config/yazi/themes/catppuccin ]]; then
    echo "Cloning Catppuccin theme..."
    git clone https://github.com/catppuccin/yazi ~/.config/yazi/themes/catppuccin
    echo "✓ Catppuccin theme installed"
else
    echo "✓ Catppuccin theme already installed"
fi

# Verify core tools
echo "🔍 Verifying core tools..."
CORE_TOOLS=("yazi" "rg" "bat" "fd" "jq")
MISSING_TOOLS=()

for tool in "${CORE_TOOLS[@]}"; do
    if ! command -v "$tool" &> /dev/null; then
        MISSING_TOOLS+=("$tool")
    fi
done

if [[ ${#MISSING_TOOLS[@]} -gt 0 ]]; then
    echo "⚠️  Missing core tools: ${MISSING_TOOLS[*]}"
    echo "Please install them manually or rerun the script."
    echo ""
fi

# Create config directory
echo "📁 Setting up configuration..."
mkdir -p ~/.config/yazi

# Check if configuration files exist
CONFIG_FILES=("yazi.toml" "theme.toml" "keymap.toml")
for file in "${CONFIG_FILES[@]}"; do
    if [[ -f ~/.config/yazi/$file ]]; then
        echo "✓ $file configuration found"
    else
        echo "⚠️  $file configuration not found in ~/.config/yazi/"
    fi
done

# Update yazi.toml to use Catppuccin theme
echo "🎨 Configuring Catppuccin theme..."
if [[ -f ~/.config/yazi/yazi.toml ]]; then
    # Check if theme line already exists
    if grep -q "theme.*catppuccin" ~/.config/yazi/yazi.toml; then
        echo "✓ Catppuccin theme already configured"
    else
        # Add theme configuration
        echo "" >> ~/.config/yazi/yazi.toml
        echo "# Catppuccin Mocha theme" >> ~/.config/yazi/yazi.toml
        echo 'theme = "catppuccin/mocha"' >> ~/.config/yazi/yazi.toml
        echo "✓ Added Catppuccin theme to yazi.toml"
    fi
else
    echo "⚠️  yazi.toml not found, please ensure configuration files are in place"
fi

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
echo "🛠️ Installation method: Built from source with Rust"
echo "🎨 Theme: Catppuccin Mocha (matches your nvim/tmux setup)"
echo "🔤 Font: JetBrains Mono Nerd Font"
echo "🧩 Minimal tools: bat, fd-find, ripgrep, jq, imagemagick"
echo "🖼️ Optional: viu for inline image previews"
echo ""
echo "📁 Configuration files:"
echo "  - ~/.config/yazi/yazi.toml (main config)"
echo "  - ~/.config/yazi/theme.toml (custom theme)"
echo "  - ~/.config/yazi/keymap.toml (keybindings)"
echo "  - ~/.config/yazi/themes/catppuccin/ (official theme)"
echo ""
echo "💡 Note: You can switch between custom theme and official Catppuccin theme"
echo "   by editing the 'theme' line in yazi.toml"
echo ""
echo "Happy file managing! 🗂️" 