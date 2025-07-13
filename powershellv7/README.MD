# Enhanced PowerShell Configuration

A modern, feature-rich PowerShell configuration that provides a seamless cross-platform development experience with beautiful prompts, enhanced file listings, Git integration, and productivity shortcuts.

## ✨ Features

- 🎨 **Beautiful Oh My Posh Prompt** - Powerlevel10k-style theme with system info, Git status, and more
- 📁 **Enhanced File Listings** - Colorful file listings with icons using Terminal-Icons
- 🔧 **Git Integration** - Comprehensive Git aliases and shortcuts
- ⚡ **Smart History** - Enhanced PSReadLine with intelligent autocomplete
- 🚀 **Development Tools** - Python, HTTP server, and utility functions
- 🌐 **Cross-Platform** - Works on Windows, Linux, and macOS

## 📋 Requirements

- **PowerShell 7.0+** (PowerShell Core) - Recommended for best compatibility
- **Windows PowerShell 5.1** - Basic compatibility (some features may be limited)

## 🚀 Installation

### 1. Install Dependencies

#### Oh My Posh

```powershell
# Install Oh My Posh
winget install JanDeDobbeleer.OhMyPosh
# or via PowerShell
Install-Module oh-my-posh -Scope CurrentUser
```

#### Required PowerShell Modules

```powershell
# Install Terminal-Icons for beautiful file listings
Install-Module -Name Terminal-Icons -Scope CurrentUser

# PSReadLine (usually pre-installed with PowerShell 7+)
Install-Module -Name PSReadLine -Scope CurrentUser -Force
```

### 2. Setup Configuration

#### Copy PowerShell Profile

1. Locate your PowerShell profile directory:
   ```powershell
   $PROFILE
   ```
2. Copy `Microsoft.PowerShell_profile.ps1` to your profile location
3. If the directory doesn't exist, create it:
   ```powershell
   New-Item -ItemType Directory -Force -Path (Split-Path $PROFILE)
   ```

#### Install Oh My Posh Theme

1. Download the `powerlevel10k_modern.omp.json` theme
2. Place it in your Oh My Posh themes directory or keep the absolute path as configured

#### Setup Git Configuration (Optional)

Copy the `.gitconfig` file to your home directory (`~/.gitconfig`) or merge the aliases into your existing Git configuration.

### 3. Apply Configuration

```powershell
# Reload your PowerShell profile
. $PROFILE

# Or restart PowerShell
```

## 🎯 Quick Start

After installation, restart PowerShell and you'll immediately have access to all the enhanced features. Type `pwsh-help` to see all available commands and shortcuts.

## 📚 Commands & Aliases

### File Operations

| Command       | Description                       | Example          |
| ------------- | --------------------------------- | ---------------- |
| `ls [path]`   | List files with formatting        | `ls`             |
| `ll [path]`   | Detailed file listing             | `ll ~/Documents` |
| `la [path]`   | List all files (including hidden) | `la`             |
| `lt [path]`   | List files sorted by time         | `lt`             |
| `tree [path]` | Show directory tree               | `tree src/`      |

### Navigation

| Command      | Description                | Example           |
| ------------ | -------------------------- | ----------------- |
| `..`         | Go up one directory        | `..`              |
| `...`        | Go up two directories      | `...`             |
| `....`       | Go up three directories    | `....`            |
| `~`          | Go to home directory       | `~`               |
| `mkcd <dir>` | Create and enter directory | `mkcd newproject` |

### Git Shortcuts

| Command         | Description                | Example             |
| --------------- | -------------------------- | ------------------- |
| `gst`           | Git status                 | `gst`               |
| `gco <branch>`  | Git checkout               | `gco main`          |
| `gcb <branch>`  | Create and checkout branch | `gcb feature/new`   |
| `ga <files>`    | Git add                    | `ga .`              |
| `gc <message>`  | Git commit                 | `gc "Fix bug"`      |
| `gcm <message>` | Git commit with message    | `gcm "Add feature"` |
| `gp`            | Git push                   | `gp`                |
| `gpl`           | Git pull                   | `gpl`               |
| `gf`            | Git fetch                  | `gf`                |
| `gd`            | Git diff                   | `gd`                |
| `gl`            | Git log (pretty)           | `gl`                |
| `glog`          | Git log (all branches)     | `glog`              |

### Development Tools

| Command        | Description         | Example                |
| -------------- | ------------------- | ---------------------- |
| `serve [port]` | Start HTTP server   | `serve 3000`           |
| `py <args>`    | Python shortcut     | `py script.py`         |
| `pip <args>`   | Python pip shortcut | `pip install requests` |
| `vim <file>`   | Open in Neovim      | `vim config.txt`       |
| `vi <file>`    | Open in Neovim      | `vi README.md`         |

### System Utilities

| Command           | Description           | Example        |
| ----------------- | --------------------- | -------------- |
| `c`               | Clear screen          | `c`            |
| `h`               | Show command history  | `h`            |
| `which <cmd>`     | Find command location | `which python` |
| `du [path]`       | Directory size usage  | `du src/`      |
| `df`              | Show disk usage       | `df`           |
| `qfind <pattern>` | Quick file search     | `qfind "*.js"` |

### Utility Functions

| Command                 | Description                  | Example                  |
| ----------------------- | ---------------------------- | ------------------------ |
| `extract <file>`        | Extract archives (.zip, .7z) | `extract archive.zip`    |
| `Get-PublicIP`          | Show your public IP address  | `Get-PublicIP`           |
| `weather [city]`        | Show weather information     | `weather London`         |
| `grep <pattern> [path]` | Search in files              | `grep "TODO" -Recursive` |

## ⌨️ Key Bindings

### PSReadLine Enhancements

- **↑/↓ Arrow Keys** - History search (type partial command, then arrow keys)
- **Tab** - Enhanced autocompletion
- **Ctrl+D** - Delete character
- **Inline Predictions** - Shows suggestions based on history

### History Features

- **50,000** command history limit
- **No duplicates** in history
- **Intelligent search** - cursor moves to end after search

## 🎨 Theme Customization

The Oh My Posh theme (`powerlevel10k_modern.omp.json`) includes:

- **OS Information** - Shows current OS and WSL status
- **User Session** - Current user display
- **Directory Path** - Current working directory with smart truncation
- **Git Status** - Branch info, staging, and working tree status
- **Docker Context** - When Docker is active
- **Time Display** - Current time with custom icon

### Customizing the Theme

Edit the `powerlevel10k_modern.omp.json` file to modify:

- Colors and styling
- Segments to display
- Icons and symbols
- Prompt format

## 🔧 Configuration Files

- **PowerShell Profile**: `Microsoft.PowerShell_profile.ps1`
- **Oh My Posh Theme**: `powerlevel10k_modern.omp.json`
- **Git Configuration**: `.gitconfig` (optional)

## 🐛 Troubleshooting

### Common Issues

1. **"Oh My Posh not found"**

   - Ensure Oh My Posh is installed and in your PATH
   - Try restarting PowerShell after installation

2. **"Terminal-Icons not displaying"**

   - Install a Nerd Font (recommended: MesloLGS NF)
   - Configure your terminal to use the installed font

3. **"Profile not loading"**

   - Check if the profile path is correct: `$PROFILE`
   - Ensure execution policy allows scripts: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

4. **"Git aliases not working"**
   - Ensure Git is installed and in your PATH
   - Verify `.gitconfig` is properly configured

### Font Recommendation

For the best experience with icons and symbols, install a Nerd Font:

- **MesloLGS NF** (recommended)
- **JetBrains Mono Nerd Font**
- **Fira Code Nerd Font**

## 🤝 Contributing

Feel free to customize this configuration to your needs! Some suggestions:

- Add more Git aliases
- Create custom functions for your workflow
- Modify the Oh My Posh theme
- Add environment-specific configurations

## 📝 License

This configuration is provided as-is for personal and educational use.

---

**Enjoy your enhanced PowerShell experience! 🚀**

Type `pwsh-help` anytime to see this information in your terminal.

