-- GitHub Copilot Configuration (Professional & Clean)
require("copilot").setup({
  panel = {
    enabled = true,
    auto_refresh = true,
    keymap = {
      jump_prev = "<C-[>",           -- Ctrl+[ for previous suggestion
      jump_next = "<C-]>",           -- Ctrl+] for next suggestion  
      accept = "<CR>",               -- Enter to accept in panel
      refresh = "<C-r>",             -- Ctrl+R to refresh
      open = "<C-A-o>"               -- Ctrl+Alt+O to open panel (like VSCode Command Palette)
    },
    layout = {
      position = "right",            -- Right panel like VSCode
      ratio = 0.3
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,             -- Auto-trigger like VSCode/Cursor
    hide_during_completion = true,
    debounce = 75,
    keymap = {
      accept = "<Tab>",              -- Tab to accept (like VSCode/Cursor)
      accept_word = "<C-Right>",     -- Ctrl+Right Arrow to accept word
      accept_line = "<C-Down>",      -- Ctrl+Down Arrow to accept line
      next = "<A-]>",                -- Alt+] for next suggestion
      prev = "<A-[>",                -- Alt+[ for previous suggestion
      dismiss = "<Esc>",             -- Escape to dismiss (intuitive)
    },
  },
  filetypes = {
    yaml = true,
    markdown = true,
    help = false,
    gitcommit = true,
    gitrebase = true,
    javascript = true,
    typescript = true,
    python = true,
    rust = true,
    go = true,
    lua = true,
    vim = true,
    ["."] = false,
  },
  copilot_node_command = 'node',
  server_opts_overrides = {},
})

-- Setup Copilot-CMP for better integration
require("copilot_cmp").setup()

-- Global Copilot keymaps (like VSCode commands)
vim.keymap.set('n', '<leader>ce', ':Copilot enable<CR>', { desc = 'Enable Copilot' })
vim.keymap.set('n', '<leader>cd', ':Copilot disable<CR>', { desc = 'Disable Copilot' })
vim.keymap.set('n', '<leader>cp', ':Copilot panel<CR>', { desc = 'Open Copilot Panel' })
vim.keymap.set('n', '<leader>cs', ':Copilot status<CR>', { desc = 'Copilot Status' })
vim.keymap.set('n', '<leader>cr', ':Copilot restart<CR>', { desc = 'Restart Copilot' })

-- Toggle Copilot on/off quickly (like Cursor's Ctrl+I)
vim.g.copilot_enabled_state = true -- Default to enabled

vim.keymap.set('n', '<C-i>', function()
  if vim.g.copilot_enabled_state then
    vim.cmd('Copilot disable')
    vim.g.copilot_enabled_state = false
    print("Copilot disabled")
  else
    vim.cmd('Copilot enable')
    vim.g.copilot_enabled_state = true
    print("Copilot enabled")
  end
end, { desc = 'Toggle Copilot' })

-- Professional styling for Copilot suggestions (VS Code-like)
vim.cmd[[highlight CopilotSuggestion ctermfg=8 guifg=#6272a4 guibg=NONE gui=italic]]
vim.cmd[[highlight CopilotAnnotation ctermfg=8 guifg=#50fa7b guibg=NONE]]
