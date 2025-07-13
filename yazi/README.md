# 🗂️ Yazi File Manager Configuration

> **Lightweight, blazing-fast terminal file manager with Catppuccin Mocha theme**

A carefully crafted Yazi configuration that seamlessly integrates with your development environment, featuring **Catppuccin Mocha** theme consistency with Neovim, Tmux, and Zsh.

## ✨ Features

- **🎨 Catppuccin Mocha Theme** - Perfectly matches your existing setup
- **🔍 FZF Integration** - Fuzzy file search with `Ctrl+f`
- **🔎 Ripgrep Integration** - Content search with `Ctrl+g`
- **🦇 Bat Integration** - Syntax-highlighted file previews
- **🖼️ Image Viewer** - Built-in image preview support
- **📁 Directory Navigation** - Intuitive vim-style navigation
- **🎯 Lightweight** - No heavy dependencies or rust toolchain
- **⚡ Performance** - Optimized for speed and efficiency

## 🚀 Quick Start

```bash
# Install Yazi and dependencies
~/.config/yazi/install.sh

# Start Yazi
yazi
# or use aliases
y
ya
fm
```

## ⌨️ Key Bindings

### Core Navigation

| Key           | Action          | Description              |
| ------------- | --------------- | ------------------------ |
| `h`           | Leave directory | Go to parent directory   |
| `l`           | Enter directory | Enter selected directory |
| `j`           | Move down       | Move cursor down         |
| `k`           | Move up         | Move cursor up           |
| `<Enter>`     | Enter directory | Navigate into directory  |
| `<Backspace>` | Back            | Go to parent directory   |
| `gg`          | Go to top       | Jump to first item       |
| `G`           | Go to bottom    | Jump to last item        |

### File Operations

| Key       | Action             | Description                            |
| --------- | ------------------ | -------------------------------------- |
| `o`       | Open               | Open file/directory                    |
| `O`       | Open with...       | Choose application to open with        |
| `<Enter>` | Open               | Open selected item                     |
| `i`       | Peek               | Preview file content                   |
| `I`       | View with bat      | Open file with bat syntax highlighting |
| `y`       | Copy               | Copy selected files                    |
| `Y`       | Copy path          | Copy file path to clipboard            |
| `p`       | Paste              | Paste copied files                     |
| `P`       | Paste (force)      | Paste with force overwrite             |
| `x`       | Cut                | Cut selected files                     |
| `d`       | Delete             | Delete selected files                  |
| `D`       | Delete permanently | Permanently delete files               |
| `r`       | Rename             | Rename selected file                   |
| `c`       | Create             | Create new file/directory              |

### Search & Filter

| Key        | Action          | Description                       |
| ---------- | --------------- | --------------------------------- |
| `<Ctrl+f>` | FZF file search | Find files using fzf              |
| `<Ctrl+g>` | Ripgrep search  | Search file contents with ripgrep |
| `/`        | Find            | Search in current directory       |
| `?`        | Find previous   | Search backwards                  |
| `n`        | Next result     | Jump to next search result        |
| `N`        | Previous result | Jump to previous search result    |
| `f`        | Filter          | Filter files by pattern           |
| `F`        | Smart filter    | Advanced file filtering           |

### Selection & Visual Mode

| Key       | Action           | Description                 |
| --------- | ---------------- | --------------------------- |
| `<Space>` | Toggle selection | Select/deselect item        |
| `v`       | Visual mode      | Enter visual selection mode |
| `V`       | Exit visual mode | Exit visual selection mode  |
| `A`       | Select all       | Select all items            |
| `a`       | Invert selection | Invert current selection    |

### Sorting & View

| Key        | Action              | Description               |
| ---------- | ------------------- | ------------------------- |
| `s`        | Sort alphabetically | Sort files alphabetically |
| `S`        | Sort by modified    | Sort by modification time |
| `z`        | Sort by size        | Sort files by size        |
| `.`        | Toggle hidden       | Show/hide hidden files    |
| `R`        | Refresh             | Refresh current directory |
| `<Ctrl+r>` | Refresh             | Alternative refresh       |

### Quick Navigation

| Key  | Action      | Description                  |
| ---- | ----------- | ---------------------------- |
| `gh` | Go home     | Navigate to home directory   |
| `gc` | Go config   | Navigate to ~/.config        |
| `gd` | Go dotfiles | Navigate to ~/dotfiles       |
| `gp` | Go projects | Navigate to ~/adhoc-projects |
| `gr` | Go root     | Navigate to root directory   |

### Terminal Integration

| Key        | Action        | Description                        |
| ---------- | ------------- | ---------------------------------- |
| `<Ctrl+t>` | Open terminal | Open terminal in current directory |
| `T`        | Terminal here | Open terminal at current location  |

### Archive Operations

| Key  | Action         | Description              |
| ---- | -------------- | ------------------------ |
| `ae` | Extract        | Extract selected archive |
| `ac` | Create archive | Create tar.gz archive    |

### Git Integration

| Key  | Action     | Description                    |
| ---- | ---------- | ------------------------------ |
| `gg` | Git status | Show git status                |
| `gl` | Git log    | Show git log (last 10 commits) |
| `gd` | Git diff   | Show git diff                  |

### Tab Management

| Key   | Action       | Description            |
| ----- | ------------ | ---------------------- |
| `t`   | New tab      | Create new tab         |
| `T`   | Close tab    | Close current tab      |
| `1-5` | Switch tab   | Switch to tab number   |
| `[`   | Previous tab | Switch to previous tab |
| `]`   | Next tab     | Switch to next tab     |

### Bookmarks

| Key | Action         | Description                  |
| --- | -------------- | ---------------------------- |
| `m` | Set bookmark   | Bookmark current directory   |
| `'` | Go to bookmark | Jump to bookmarked directory |

### Help & Misc

| Key | Action         | Description                           |
| --- | -------------- | ------------------------------------- |
| `~` | Help           | Show all keybindings                  |
| `q` | Quit           | Exit Yazi                             |
| `Q` | Quit (no save) | Exit without saving current directory |
| `w` | Tasks          | Show background tasks                 |

## 🎨 Theme & Appearance

### Catppuccin Mocha Colors

- **Base**: `#1e1e2e` - Background
- **Text**: `#cdd6f4` - Primary text
- **Blue**: `#89b4fa` - Directories, links
- **Green**: `#a6e3a1` - Executables, images
- **Yellow**: `#f9e2af` - Archives, configs
- **Red**: `#f38ba8` - Documents, warnings
- **Purple**: `#cba6f7` - Special files
- **Gray**: `#6c7086` - Hidden files, comments

### File Type Colors

| Type            | Color   | Examples          |
| --------------- | ------- | ----------------- |
| **Directories** | Blue    | Folders, symlinks |
| **Executables** | Green   | Scripts, binaries |
| **Images**      | Green   | PNG, JPG, GIF     |
| **Videos**      | Yellow  | MP4, AVI, MKV     |
| **Archives**    | Red     | ZIP, TAR, 7Z      |
| **Documents**   | Red     | PDF, DOC, TXT     |
| **Code**        | Various | JS, PY, RS, GO    |
| **Hidden**      | Gray    | Dotfiles          |

### Icons

Uses **Nerd Font icons** for beautiful file type representation:

- 📁 Directories
- 📄 Text files
- 🖼️ Images
- 🎵 Audio files
- 🎬 Video files
- 📦 Archives
- ⚙️ Config files
- 🔧 Executables

## 🔧 Configuration Files

### `yazi.toml` - Main Configuration

- **Manager settings**: Layout, sorting, display options
- **Preview settings**: Image quality, size limits
- **Opener rules**: How to handle different file types
- **Task settings**: Background operation limits

### `theme.toml` - Visual Theme

- **Catppuccin Mocha** color scheme
- **File type colors** and icons
- **UI element** styling
- **Status bar** appearance

### `keymap.toml` - Key Bindings

- **Custom shortcuts** for productivity
- **Tool integrations** (fzf, ripgrep, bat)
- **Navigation** enhancements
- **Git workflow** shortcuts

## 🛠️ Installation

### Prerequisites

```bash
# Build dependencies
sudo apt install build-essential curl git unzip

# Minimal preview tools
sudo apt install bat fd-find ripgrep jq imagemagick
```

### Automated Installation

```bash
# Run the installation script
chmod +x ~/.config/yazi/install.sh
~/.config/yazi/install.sh
```

### Manual Installation

1. **Install Rust toolchain**:

   ```bash
   curl https://sh.rustup.rs -sSf | sh
   source "$HOME/.cargo/env"
   ```

2. **Clone and build Yazi**:

   ```bash
   git clone https://github.com/sxyazi/yazi
   cd yazi
   cargo build --release
   ```

3. **Install the binary**:

   ```bash
   sudo cp target/release/yazi /usr/local/bin/
   sudo cp target/release/ya /usr/local/bin/
   ```

4. **Optional: Install viu for inline image previews**:

   ```bash
   cargo install viu
   ```

5. **Install JetBrains Mono Nerd Font**:

   ```bash
   mkdir -p ~/.local/share/fonts
   curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip -o JetBrainsMono.zip
   unzip JetBrainsMono.zip -d ~/.local/share/fonts/
   fc-cache -fv
   ```

6. **Add Catppuccin theme**:

   ```bash
   mkdir -p ~/.config/yazi/themes
   git clone https://github.com/catppuccin/yazi ~/.config/yazi/themes/catppuccin
   ```

7. **Copy configuration files** to `~/.config/yazi/`

## 🔗 Integration

### With Neovim

- **Consistent theme** with Catppuccin Mocha
- **File editing** opens in Neovim
- **Terminal integration** for seamless workflow

### With Tmux

- **Theme consistency** across all panes
- **Terminal sessions** integrate perfectly
- **Workspace management** with tmux sessions

### With Zsh

- **Aliases**: `y`, `ya`, `fm` for quick access
- **History integration** with shell commands
- **Tool consistency** with fzf, ripgrep, bat

## 🎯 Workflow Tips

### File Management

1. **Use `Ctrl+f`** for quick file finding
2. **Use `Ctrl+g`** to search file contents
3. **Use `I`** to preview files with syntax highlighting
4. **Use tabs** for multiple directory workflows
5. **Use bookmarks** for frequently accessed directories

### Navigation

1. **Master `h/j/k/l`** for vim-style movement
2. **Use `gg/G`** for quick jumps
3. **Use `gh/gc/gd`** for quick directory access
4. **Use visual mode** for bulk operations
5. **Use `<Enter>`** vs `o` appropriately

### Productivity

1. **Learn search shortcuts** (`/`, `n`, `N`)
2. **Use sort options** (`s`, `S`, `z`)
3. **Toggle hidden files** (`.`) when needed
4. **Use terminal integration** (`Ctrl+t`)
5. **Check tasks** (`w`) for background operations

## 🐛 Troubleshooting

### Common Issues

**Yazi won't start:**

```bash
# Check if yazi is installed
which yazi

# Check configuration syntax
yazi --help
```

**Theme not loading:**

```bash
# Verify theme file exists
ls ~/.config/yazi/theme.toml

# Check for syntax errors in theme file
```

**Icons not showing:**

```bash
# Install Nerd Font
fc-list | grep -i "jetbrains"

# Update font cache
fc-cache -fv
```

**FZF integration not working:**

```bash
# Verify fzf is installed
which fzf

# Check if fd is available
which fd || which fdfind
```

## 📚 Resources

- **[Yazi Documentation](https://yazi-rs.github.io/)**
- **[Catppuccin Theme](https://github.com/catppuccin/catppuccin)**
- **[Nerd Fonts](https://www.nerdfonts.com/)**
- **[FZF](https://github.com/junegunn/fzf)**
- **[Ripgrep](https://github.com/BurntSushi/ripgrep)**
- **[Bat](https://github.com/sharkdp/bat)**

---

**💡 Pro Tip**: Use `~` inside Yazi to see all available keybindings. The configuration is designed to be intuitive and consistent with your existing vim/tmux workflow.

For complete development environment setup, see the main [dotfiles README](../README.md).
