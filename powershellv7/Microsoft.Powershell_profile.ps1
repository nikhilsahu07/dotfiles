# ============================================================================
# ENHANCED POWERSHELL CONFIGURATION
 ============================================================================

# === OH-MY-POSH PROMPT ===
oh-my-posh init pwsh --config 'C:\Users\heyni\AppData\Local\Programs\oh-my-posh\themes\powerlevel10k_modern.omp.json' | Invoke-Expression

# === MODULES ===
Import-Module -Name Terminal-Icons
Import-Module PSReadLine

# === PSREADLINE CONFIGURATION ===
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -MaximumHistoryCount 50000

# Enhanced key bindings
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Key Ctrl+d -Function DeleteChar

# === ENHANCED FILE LISTING ALIASES ===
# Modern file listing with icons (using Terminal-Icons like dir)
function ls { 
    param([string]$Path = ".")
    Get-ChildItem $Path | Format-Table
}

function ll { 
    param([string]$Path = ".")
    Get-ChildItem $Path | Format-Table Mode, LastWriteTime, Length, Name -AutoSize
}

function la { 
    param([string]$Path = ".")
    Get-ChildItem $Path -Force | Format-Table Mode, LastWriteTime, Length, Name -AutoSize
}

function l { 
    param([string]$Path = ".")
    Get-ChildItem $Path | Format-Table Mode, LastWriteTime, Length, Name -AutoSize
}

function lt { 
    param([string]$Path = ".")
    Get-ChildItem $Path | Sort-Object LastWriteTime -Descending | Format-Table Mode, LastWriteTime, Length, Name -AutoSize
}

function tree {
    param([string]$Path = ".")
    if (Get-Command tree.com -ErrorAction SilentlyContinue) {
        tree.com $Path /F
    } else {
        # Fallback tree using PowerShell
        Get-ChildItem $Path -Recurse | Format-Table FullName
    }
}

# === GIT ALIASES (matching Zsh) ===
function gst { git status }
function gco { git checkout $args }
function gcb { git checkout -b $args }
function gp { git push $args }
function gpl { git pull $args }
function gf { git fetch $args }
function ga { git add $args }
function gc { git commit $args }
function gcm { git commit -m $args }
function gd { git diff $args }
function gl { git log --oneline --graph --decorate $args }
function glog { git log --oneline --graph --decorate --all $args }

# === SYSTEM ALIASES (matching Zsh) ===
function .. { Set-Location .. }
function ... { Set-Location ../.. }
function .... { Set-Location ../../.. }
function ~ { Set-Location $HOME }
function c { Clear-Host }
function h { Get-History }
function j { Get-Job }

# Enhanced system aliases
function which { param($name) Get-Command $name | Select-Object -ExpandProperty Definition }
function du { param($path = ".") Get-ChildItem $path -Recurse | Measure-Object -Property Length -Sum }
function df { Get-PSDrive -PSProvider FileSystem }

# === DEVELOPMENT ALIASES ===
function serve { 
    param([int]$Port = 8000)
    python -m http.server $Port
}
function py { python $args }
function pip { python -m pip $args }

# === EDITOR ALIASES ===
function vim { nvim $args }
function vi { nvim $args }

# === CUSTOM FUNCTIONS (matching Zsh) ===

# Create directory and navigate to it
function mkcd {
    param([string]$Path)
    if ($Path) {
        New-Item -ItemType Directory -Force -Path $Path | Out-Null
        Set-Location $Path
        Write-Host "Created and entered directory: $Path" -ForegroundColor Green
    } else {
        Write-Host "Usage: mkcd <directory-name>" -ForegroundColor Red
    }
}

# Quick find function
function qfind {
    param([string]$Pattern)
    if ($Pattern) {
        Get-ChildItem -Recurse -Name "*$Pattern*" 2>$null
    } else {
        Write-Host "Usage: qfind <pattern>" -ForegroundColor Red
    }
}

# Extract archives (PowerShell equivalent)
function extract {
    param([string]$File)
    
    if (-not $File) {
        Write-Host "Usage: extract <file>" -ForegroundColor Red
        return
    }
    
    if (-not (Test-Path $File)) {
        Write-Host "'$File' is not a valid file" -ForegroundColor Red
        return
    }
    
    $extension = [System.IO.Path]::GetExtension($File).ToLower()
    
    switch ($extension) {
        ".zip" { 
            Expand-Archive -Path $File -DestinationPath (Get-ChildItem $File).BaseName
            Write-Host "Extracted: $File" -ForegroundColor Green
        }
        ".7z" {
            if (Get-Command 7z -ErrorAction SilentlyContinue) {
                7z x $File
            } else {
                Write-Host "7z command not found. Please install 7-Zip." -ForegroundColor Red
            }
        }
        default {
            Write-Host "'$File' cannot be extracted via extract()" -ForegroundColor Red
            Write-Host "Supported formats: .zip, .7z" -ForegroundColor Yellow
        }
    }
}

# === ENHANCED GREP FUNCTIONS ===
function grep {
    param(
        [string]$Pattern,
        [string]$Path = ".",
        [switch]$Recursive
    )
    
    if ($Recursive) {
        Select-String -Pattern $Pattern -Path "$Path\*" -Recurse
    } else {
        Select-String -Pattern $Pattern -Path $Path
    }
}

# === UTILITY FUNCTIONS ===

# Get public IP
function Get-PublicIP {
    try {
        (Invoke-RestMethod -Uri "https://api.ipify.org").Trim()
    } catch {
        Write-Host "Failed to get public IP" -ForegroundColor Red
    }
}

# Weather function
function weather {
    param([string]$City = "")
    if ($City) {
        curl "wttr.in/$City"
    } else {
        curl "wttr.in"
    }
}

# === HELP FUNCTION ===
function pwsh-help {
    Write-Host "🎨 Enhanced PowerShell Configuration" -ForegroundColor Cyan
    Write-Host "====================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "🔧 Useful Aliases:" -ForegroundColor Yellow
    Write-Host "  ls, ll, la, l, tree, lt - Enhanced file listings with icons" -ForegroundColor White
    Write-Host "  gst, gco, gp, gl    - Git shortcuts" -ForegroundColor White
    Write-Host "  mkcd <dir>          - Create and enter directory" -ForegroundColor White
    Write-Host "  extract <file>      - Extract archives" -ForegroundColor White
    Write-Host "  py, pip             - Python shortcuts" -ForegroundColor White
    Write-Host "  serve [port]        - Start HTTP server (default: 8000)" -ForegroundColor White
    Write-Host ""
    Write-Host "⚡ Features:" -ForegroundColor Yellow
    Write-Host "  • Oh My Posh prompt matching Powerlevel10k design" -ForegroundColor White
    Write-Host "  • Enhanced file listing with Terminal-Icons support" -ForegroundColor White
    Write-Host "  • Git integration and shortcuts" -ForegroundColor White
    Write-Host "  • Cross-platform development tools" -ForegroundColor White
    Write-Host "  • Enhanced history and completions" -ForegroundColor White
    Write-Host ""
    Write-Host "💡 Additional Commands:" -ForegroundColor Yellow
    Write-Host "  Get-PublicIP        - Show your public IP address" -ForegroundColor White
    Write-Host "  weather [city]      - Show weather information" -ForegroundColor White
    Write-Host "  qfind <pattern>     - Quick file search" -ForegroundColor White
    Write-Host ""
}

# === WELCOME MESSAGE ===
Write-Host "🚀 Enhanced PowerShell loaded! Type 'pwsh-help' for commands. Follow and Star my github nikhilsahu07/dotfiles. To remove this code $profile and remove line 225,226" -ForegroundColor Green
