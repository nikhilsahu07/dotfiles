-- Navigate vim panes better (Ctrl+J now used for terminal)
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
-- vim.keymap.set('n', '<c-j>', ':wincmd j<CR>') -- Removed: Ctrl+J is now terminal toggle
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Copilot Quick Help
vim.keymap.set('n', '<leader>ch', function()
  print([[
🤖 GitHub Copilot - VSCode/Cursor Style Shortcuts:

✨ SUGGESTIONS:
  Tab           → Accept suggestion
  Ctrl+Right    → Accept word
  Ctrl+Down     → Accept line
  Alt+]         → Next suggestion  
  Alt+[         → Previous suggestion
  Esc           → Dismiss suggestion

🎛️  CONTROLS:
  Ctrl+I        → Toggle Copilot on/off
  <leader>ce    → Enable Copilot
  <leader>cd    → Disable Copilot
  <leader>cp    → Open Copilot panel
  <leader>cs    → Check Copilot status
  <leader>cr    → Restart Copilot
  
📊 PANEL:
  Ctrl+Alt+O    → Open suggestions panel
  Ctrl+[        → Previous in panel
  Ctrl+]        → Next in panel
  Enter         → Accept from panel
  Ctrl+R        → Refresh panel

💡 Status shown in bottom right of status bar!
  ]])
end, { desc = 'Show Copilot Help' })

-- Quick access to common files (VSCode-like)
vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>', { desc = 'Find Files' })
vim.keymap.set('n', '<C-S-p>', ':Telescope commands<CR>', { desc = 'Command Palette' })