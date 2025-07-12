# ⌨️ Key Bindings & Shortcuts Reference

> Complete reference guide for all key bindings, shortcuts, and aliases in the Professional Development Environment.

## 🌟 Neovim Key Bindings

### Basic Navigation & Editing

| Key       | Action                  | Description                         |
| --------- | ----------------------- | ----------------------------------- |
| `Space`   | Leader Key              | Main leader key for custom commands |
| `h/j/k/l` | Move Left/Down/Up/Right | Vim-style navigation                |
| `w/b`     | Word Forward/Backward   | Move by words                       |
| `gg/G`    | Go to Top/Bottom        | Document navigation                 |
| `0/$`     | Line Start/End          | Move to beginning/end of line       |
| `i/a`     | Insert Before/After     | Enter insert mode                   |
| `I/A`     | Insert Line Start/End   | Insert at line beginning/end        |
| `o/O`     | Open Line Below/Above   | Create new line and insert          |
| `x`       | Delete Character        | Delete character under cursor       |
| `dd`      | Delete Line             | Delete entire line                  |
| `yy`      | Yank Line               | Copy entire line                    |
| `p/P`     | Paste After/Before      | Paste from clipboard                |
| `u`       | Undo                    | Undo last change                    |
| `Ctrl+r`  | Redo                    | Redo last undone change             |

### Window & Pane Management

| Key       | Action           | Description               |
| --------- | ---------------- | ------------------------- |
| `Ctrl+h`  | Move Left        | Navigate to left window   |
| `Ctrl+k`  | Move Up          | Navigate to upper window  |
| `Ctrl+l`  | Move Right       | Navigate to right window  |
| `Ctrl+j`  | Terminal Toggle  | Toggle terminal (custom)  |
| `Space+v` | Vertical Split   | Split window vertically   |
| `Space+h` | Horizontal Split | Split window horizontally |
| `Space+q` | Close Window     | Close current window      |
| `Space+o` | Only Window      | Close all other windows   |

### File Operations

| Key            | Action          | Description                |
| -------------- | --------------- | -------------------------- |
| `Ctrl+p`       | Find Files      | Open Telescope file finder |
| `Ctrl+Shift+p` | Command Palette | Open Telescope commands    |
| `Space+ff`     | Find Files      | Alternative file finder    |
| `Space+fg`     | Find Text       | Grep search in files       |
| `Space+fb`     | Find Buffers    | Search open buffers        |
| `Space+fh`     | Find Help       | Search help documentation  |
| `Space+fr`     | Recent Files    | Find recently opened files |
| `Space+e`      | File Explorer   | Toggle NvimTree            |
| `Space+o`      | Oil Explorer    | Toggle Oil file manager    |

### Search & Replace

| Key              | Action          | Description               |
| ---------------- | --------------- | ------------------------- |
| `/`              | Search Forward  | Search text forward       |
| `?`              | Search Backward | Search text backward      |
| `n/N`            | Next/Previous   | Navigate search results   |
| `*`              | Search Word     | Search word under cursor  |
| `Space+h`        | Clear Highlight | Clear search highlights   |
| `:%s/old/new/g`  | Replace All     | Replace all occurrences   |
| `:%s/old/new/gc` | Replace Confirm | Replace with confirmation |

### LSP (Language Server Protocol)

| Key        | Action               | Description                 |
| ---------- | -------------------- | --------------------------- |
| `gd`       | Go to Definition     | Jump to definition          |
| `gD`       | Go to Declaration    | Jump to declaration         |
| `gr`       | Go to References     | Show all references         |
| `gi`       | Go to Implementation | Jump to implementation      |
| `K`        | Hover Documentation  | Show documentation          |
| `Space+ca` | Code Actions         | Show available code actions |
| `Space+rn` | Rename               | Rename symbol               |
| `Space+f`  | Format               | Format document             |
| `Space+D`  | Type Definition      | Go to type definition       |
| `[d`       | Previous Diagnostic  | Go to previous diagnostic   |
| `]d`       | Next Diagnostic      | Go to next diagnostic       |
| `Space+d`  | Show Diagnostics     | Show diagnostic details     |

### Git Integration (Gitsigns)

| Key        | Action         | Description                  |
| ---------- | -------------- | ---------------------------- |
| `]c`       | Next Hunk      | Jump to next git hunk        |
| `[c`       | Previous Hunk  | Jump to previous git hunk    |
| `Space+hs` | Stage Hunk     | Stage current hunk           |
| `Space+hr` | Reset Hunk     | Reset current hunk           |
| `Space+hS` | Stage Buffer   | Stage entire buffer          |
| `Space+hR` | Reset Buffer   | Reset entire buffer          |
| `Space+hp` | Preview Hunk   | Preview hunk changes         |
| `Space+hb` | Blame Line     | Show git blame for line      |
| `Space+tb` | Toggle Blame   | Toggle line blame display    |
| `Space+hd` | Diff This      | Show diff for current file   |
| `Space+td` | Toggle Deleted | Toggle deleted lines display |

### GitHub Copilot

| Key          | Action              | Description                |
| ------------ | ------------------- | -------------------------- |
| `Tab`        | Accept Suggestion   | Accept current suggestion  |
| `Ctrl+Right` | Accept Word         | Accept next word           |
| `Ctrl+Down`  | Accept Line         | Accept current line        |
| `Alt+]`      | Next Suggestion     | Show next suggestion       |
| `Alt+[`      | Previous Suggestion | Show previous suggestion   |
| `Esc`        | Dismiss             | Dismiss current suggestion |
| `Ctrl+i`     | Toggle Copilot      | Toggle Copilot on/off      |
| `Space+ce`   | Enable Copilot      | Enable Copilot             |
| `Space+cd`   | Disable Copilot     | Disable Copilot            |
| `Space+cp`   | Copilot Panel       | Open Copilot panel         |
| `Space+cs`   | Copilot Status      | Check Copilot status       |
| `Space+cr`   | Restart Copilot     | Restart Copilot            |
| `Space+ch`   | Copilot Help        | Show Copilot help          |
| `Ctrl+Alt+o` | Suggestions Panel   | Open suggestions panel     |

### Terminal Integration

| Key        | Action              | Description              |
| ---------- | ------------------- | ------------------------ |
| `Ctrl+j`   | Toggle Terminal     | Toggle terminal window   |
| `Ctrl+\`   | New Terminal        | Create new terminal      |
| `Alt+1`    | Terminal 1          | Switch to terminal 1     |
| `Alt+2`    | Terminal 2          | Switch to terminal 2     |
| `Alt+3`    | Terminal 3          | Switch to terminal 3     |
| `Space+tf` | Float Terminal      | Open floating terminal   |
| `Space+th` | Horizontal Terminal | Open horizontal terminal |
| `Space+tv` | Vertical Terminal   | Open vertical terminal   |

### Telescope (Fuzzy Finder)

| Key            | Action       | Description               |
| -------------- | ------------ | ------------------------- |
| `Ctrl+p`       | Find Files   | Open file finder          |
| `Ctrl+Shift+p` | Commands     | Open command palette      |
| `Space+ff`     | Find Files   | Find files in project     |
| `Space+fg`     | Live Grep    | Search text in files      |
| `Space+fb`     | Buffers      | Search open buffers       |
| `Space+fh`     | Help Tags    | Search help documentation |
| `Space+fr`     | Recent Files | Find recent files         |
| `Space+fm`     | Marks        | Search marks              |
| `Space+fk`     | Keymaps      | Search key mappings       |
| `Space+fc`     | Commands     | Search commands           |
| `Space+ft`     | Colorschemes | Search colorschemes       |

### Completion (nvim-cmp)

| Key          | Action        | Description                |
| ------------ | ------------- | -------------------------- |
| `Tab`        | Next Item     | Select next completion     |
| `Shift+Tab`  | Previous Item | Select previous completion |
| `Enter`      | Confirm       | Confirm selection          |
| `Ctrl+Space` | Trigger       | Trigger completion         |
| `Ctrl+e`     | Abort         | Abort completion           |
| `Ctrl+b`     | Scroll Up     | Scroll docs up             |
| `Ctrl+f`     | Scroll Down   | Scroll docs down           |

### Debugging (DAP)

| Key        | Action            | Description            |
| ---------- | ----------------- | ---------------------- |
| `Space+db` | Toggle Breakpoint | Toggle breakpoint      |
| `Space+dc` | Continue          | Continue execution     |
| `Space+ds` | Step Over         | Step over              |
| `Space+di` | Step Into         | Step into              |
| `Space+do` | Step Out          | Step out               |
| `Space+dr` | Repl Toggle       | Toggle REPL            |
| `Space+dl` | Run Last          | Run last debug session |

## 🔧 Tmux Key Bindings

### Session Management

| Key                         | Action         | Description               |
| --------------------------- | -------------- | ------------------------- |
| `Ctrl+b`                    | Prefix         | Tmux prefix key           |
| `Prefix+:`                  | Command Mode   | Enter command mode        |
| `Prefix+?`                  | List Keys      | Show all key bindings     |
| `Prefix+r`                  | Reload Config  | Reload tmux configuration |
| `Prefix+d`                  | Detach         | Detach from session       |
| `tmux new -s name`          | New Session    | Create named session      |
| `tmux ls`                   | List Sessions  | Show all sessions         |
| `tmux attach -t name`       | Attach Session | Attach to named session   |
| `tmux kill-session -t name` | Kill Session   | Kill named session        |

### Window Management

| Key          | Action          | Description                |
| ------------ | --------------- | -------------------------- |
| `Prefix+c`   | New Window      | Create new window          |
| `Prefix+&`   | Kill Window     | Kill current window        |
| `Prefix+,`   | Rename Window   | Rename current window      |
| `Prefix+n`   | Next Window     | Switch to next window      |
| `Prefix+p`   | Previous Window | Switch to previous window  |
| `Prefix+0-9` | Select Window   | Switch to window by number |
| `Prefix+w`   | List Windows    | Show window list           |
| `Prefix+f`   | Find Window     | Find window by name        |
| `Prefix+l`   | Last Window     | Switch to last window      |

### Pane Management

| Key        | Action           | Description             |
| ---------- | ---------------- | ----------------------- |
| `Prefix+%` | Split Horizontal | Split pane horizontally |
| `Prefix+"` | Split Vertical   | Split pane vertically   |
| `Prefix+x` | Kill Pane        | Kill current pane       |
| `Prefix+h` | Move Left        | Move to left pane       |
| `Prefix+j` | Move Down        | Move to lower pane      |
| `Prefix+k` | Move Up          | Move to upper pane      |
| `Prefix+l` | Move Right       | Move to right pane      |
| `Prefix+z` | Zoom Pane        | Toggle pane zoom        |
| `Prefix+o` | Next Pane        | Switch to next pane     |
| `Prefix+;` | Last Pane        | Switch to last pane     |
| `Prefix+q` | Show Panes       | Show pane numbers       |
| `Prefix+{` | Swap Left        | Swap pane left          |
| `Prefix+}` | Swap Right       | Swap pane right         |

### Copy Mode (Vi-style)

| Key        | Action           | Description            |
| ---------- | ---------------- | ---------------------- |
| `Prefix+[` | Enter Copy Mode  | Enter copy mode        |
| `Space`    | Start Selection  | Start text selection   |
| `Enter`    | Copy Selection   | Copy selected text     |
| `Prefix+]` | Paste            | Paste copied text      |
| `q`        | Exit Copy Mode   | Exit copy mode         |
| `h/j/k/l`  | Navigate         | Move cursor            |
| `v`        | Visual Selection | Start visual selection |
| `y`        | Yank             | Copy selected text     |

### Plugin Management (TPM)

| Key            | Action            | Description           |
| -------------- | ----------------- | --------------------- |
| `Prefix+I`     | Install Plugins   | Install new plugins   |
| `Prefix+U`     | Update Plugins    | Update all plugins    |
| `Prefix+Alt+u` | Uninstall Plugins | Remove unused plugins |

## 🐚 Zsh Aliases & Functions

### Enhanced File Operations

| Alias  | Command                      | Description             |
| ------ | ---------------------------- | ----------------------- |
| `ll`   | `lsd -la --group-dirs=first` | Long listing with icons |
| `la`   | `lsd -la --group-dirs=first` | All files with icons    |
| `l`    | `lsd -l --group-dirs=first`  | Simple long listing     |
| `ls`   | `lsd --group-dirs=first`     | List with icons         |
| `tree` | `lsd --tree`                 | Tree view with icons    |
| `lt`   | `lsd -la --sort=time`        | Sort by time            |
| `..`   | `cd ..`                      | Go up one directory     |
| `...`  | `cd ../..`                   | Go up two directories   |
| `....` | `cd ../../..`                | Go up three directories |
| `~`    | `cd ~`                       | Go to home directory    |

### System & Utility Aliases

| Alias   | Command              | Description                         |
| ------- | -------------------- | ----------------------------------- |
| `c`     | `clear`              | Clear terminal                      |
| `h`     | `history`            | Show command history                |
| `j`     | `jobs`               | Show active jobs                    |
| `which` | `type -a`            | Show command type                   |
| `du`    | `du -h`              | Human readable disk usage           |
| `df`    | `df -h`              | Human readable disk free            |
| `bat`   | `batcat`             | Better cat with syntax highlighting |
| `grep`  | `grep --color=auto`  | Colored grep                        |
| `fgrep` | `fgrep --color=auto` | Colored fgrep                       |
| `egrep` | `egrep --color=auto` | Colored egrep                       |
| `vim`   | `nvim`               | Use Neovim instead of vim           |
| `vi`    | `nvim`               | Use Neovim instead of vi            |

### Git Aliases

| Alias  | Command                                      | Description                |
| ------ | -------------------------------------------- | -------------------------- |
| `gst`  | `git status`                                 | Show git status            |
| `gco`  | `git checkout`                               | Checkout branch/commit     |
| `gcb`  | `git checkout -b`                            | Create and checkout branch |
| `gp`   | `git push`                                   | Push to remote             |
| `gpl`  | `git pull`                                   | Pull from remote           |
| `gf`   | `git fetch`                                  | Fetch from remote          |
| `ga`   | `git add`                                    | Add files to staging       |
| `gc`   | `git commit`                                 | Commit changes             |
| `gcm`  | `git commit -m`                              | Commit with message        |
| `gd`   | `git diff`                                   | Show differences           |
| `gl`   | `git log --oneline --graph --decorate`       | Pretty log                 |
| `glog` | `git log --oneline --graph --decorate --all` | Full pretty log            |

### Development Aliases

| Alias   | Command                  | Description            |
| ------- | ------------------------ | ---------------------- |
| `serve` | `python3 -m http.server` | Start HTTP server      |
| `py`    | `python3`                | Python 3 interpreter   |
| `pip`   | `pip3`                   | Python package manager |

### Custom Functions

| Function   | Usage                 | Description                   |
| ---------- | --------------------- | ----------------------------- |
| `mkcd`     | `mkcd dirname`        | Create directory and enter it |
| `qfind`    | `qfind pattern`       | Quick find files by pattern   |
| `extract`  | `extract archive.zip` | Extract any archive format    |
| `zsh_help` | `zsh_help`            | Show zsh configuration help   |

### History Navigation

| Key          | Action            | Description                           |
| ------------ | ----------------- | ------------------------------------- |
| `Ctrl+r`     | Reverse Search    | Search command history                |
| `Ctrl+p`     | Previous Command  | Go to previous command                |
| `Ctrl+n`     | Next Command      | Go to next command                    |
| `!!`         | Last Command      | Repeat last command                   |
| `!n`         | Command by Number | Run command number n                  |
| `!string`    | Command by String | Run last command starting with string |
| `Up Arrow`   | Previous Command  | Navigate history up                   |
| `Down Arrow` | Next Command      | Navigate history down                 |

### Word Navigation

| Key          | Action            | Description                |
| ------------ | ----------------- | -------------------------- |
| `Ctrl+a`     | Line Start        | Move to beginning of line  |
| `Ctrl+e`     | Line End          | Move to end of line        |
| `Ctrl+b`     | Character Back    | Move one character back    |
| `Ctrl+f`     | Character Forward | Move one character forward |
| `Ctrl+Left`  | Word Back         | Move one word back         |
| `Ctrl+Right` | Word Forward      | Move one word forward      |
| `Alt+b`      | Word Back         | Alternative word back      |
| `Alt+f`      | Word Forward      | Alternative word forward   |

### Text Manipulation

| Key      | Action              | Description                      |
| -------- | ------------------- | -------------------------------- |
| `Ctrl+u` | Delete to Start     | Delete from cursor to line start |
| `Ctrl+k` | Delete to End       | Delete from cursor to line end   |
| `Ctrl+w` | Delete Word Back    | Delete word backwards            |
| `Alt+d`  | Delete Word Forward | Delete word forwards             |
| `Ctrl+y` | Paste               | Paste last killed text           |
| `Ctrl+t` | Transpose Chars     | Swap current and previous char   |
| `Alt+t`  | Transpose Words     | Swap current and previous word   |

### Tab Completion

| Key       | Action       | Description                 |
| --------- | ------------ | --------------------------- |
| `Tab`     | Complete     | Complete command/filename   |
| `Tab Tab` | List Options | Show all completion options |
| `Ctrl+d`  | List Options | Alternative to show options |
| `Ctrl+i`  | Complete     | Alternative tab completion  |

### FZF Integration

| Key       | Action           | Description                |
| --------- | ---------------- | -------------------------- |
| `Ctrl+r`  | History Search   | FZF command history search |
| `Ctrl+t`  | File Search      | FZF file search            |
| `Alt+c`   | Directory Search | FZF directory search       |
| `**<Tab>` | Fuzzy Completion | FZF path completion        |

## 🔀 Git Configuration Aliases

### Basic Git Shortcuts

| Alias | Command                                                           | Description           |
| ----- | ----------------------------------------------------------------- | --------------------- |
| `co`  | `checkout`                                                        | Checkout branch       |
| `cm`  | `commit`                                                          | Commit changes        |
| `s`   | `status`                                                          | Show status           |
| `br`  | `branch`                                                          | Branch operations     |
| `df`  | `diff`                                                            | Show differences      |
| `l`   | `log`                                                             | Show commit log       |
| `lgp` | `log --pretty=format:"%h %ad \| %s%d [%an]" --graph --date=short` | Pretty log with graph |
| `bl`  | `blame`                                                           | Show file blame       |
| `a`   | `add`                                                             | Add files to staging  |

### Advanced Git Commands

| Command               | Description                         |
| --------------------- | ----------------------------------- |
| `git co -b feature`   | Create and switch to feature branch |
| `git cm -m "message"` | Commit with message                 |
| `git lgp --all`       | Show all branches in graph          |
| `git bl filename`     | Show blame for specific file        |
| `git df --staged`     | Show staged differences             |
| `git s --short`       | Show short status                   |
| `git br -a`           | Show all branches                   |
| `git br -d branch`    | Delete branch                       |
| `git br -m newname`   | Rename current branch               |

## 🎯 Productivity Tips

### Neovim Workflow

1. **Use leader key combinations** - Most custom commands start with `Space`
2. **Master telescope** - `Ctrl+p` for files, `Space+fg` for text search
3. **Learn LSP navigation** - `gd` for definition, `gr` for references
4. **Use git hunks** - `]c` and `[c` to navigate changes
5. **Terminal integration** - `Ctrl+j` for quick terminal access

### Tmux Productivity

1. **Create named sessions** - `tmux new -s project-name`
2. **Use window numbers** - `Prefix+0-9` for quick switching
3. **Master pane navigation** - `Prefix+hjkl` for movement
4. **Zoom panes** - `Prefix+z` to focus on one pane
5. **Copy mode** - `Prefix+[` for text selection

### Zsh Efficiency

1. **Use aliases** - `ll`, `gst`, `gco` for common operations
2. **Leverage history** - `Ctrl+r` for reverse search
3. **Tab completion** - Let zsh complete commands and paths
4. **Custom functions** - `mkcd`, `extract`, `qfind` for common tasks
5. **FZF integration** - `Ctrl+t` for file search, `Alt+c` for directories

### Git Workflow

1. **Use short aliases** - `gst`, `gco`, `gcm` for speed
2. **Pretty logs** - `gl` or `glog` for visual history
3. **Interactive staging** - `ga -p` for partial commits
4. **Branch management** - `gcb` for new branches
5. **Diff tools** - `gd` for changes, `gd --staged` for staged

## 📚 Quick Reference Cards

### Essential Neovim

```
Leader: Space
Files: Ctrl+p, Space+e
Search: Space+fg, /
LSP: gd, gr, K, Space+ca
Git: ]c, [c, Space+hs
Terminal: Ctrl+j
```

### Essential Tmux

```
Prefix: Ctrl+b
Windows: Prefix+c, Prefix+1-9
Panes: Prefix+%, Prefix+"
Navigate: Prefix+hjkl
Zoom: Prefix+z
Copy: Prefix+[
```

### Essential Zsh

```
History: Ctrl+r
Files: ll, la, tree
Git: gst, gco, gp, gl
Navigation: .., ..., ....
Functions: mkcd, extract, qfind
```

---

**💡 Pro Tip**: Print this reference and keep it handy while learning. Muscle memory develops with practice!

For setup instructions, see [setup.md](setup.md).
For configuration overview, see [README.md](README.md).
