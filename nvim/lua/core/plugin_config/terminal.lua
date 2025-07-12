-- Terminal Configuration (VSCode/Cursor-style)
require("toggleterm").setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-j>]], -- Ctrl+J to toggle terminal (like VSCode/Cursor)
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true, -- Apply mappings in insert mode
  terminal_mappings = true, -- Apply mappings in terminal mode
  persist_size = true,
  direction = "horizontal", -- Start with horizontal split (bottom)
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

-- Terminal keymaps (available in terminal mode)
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  -- Ctrl+J to toggle even from within terminal
  vim.keymap.set('t', '<C-j>', [[<Cmd>ToggleTerm<CR>]], opts)
  -- Easy navigation out of terminal
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  -- Esc to go to normal mode in terminal
  vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)
end

-- Apply terminal keymaps when terminal opens
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Additional terminal shortcuts (VSCode/Cursor-style)
local Terminal = require('toggleterm.terminal').Terminal

-- Horizontal terminal (bottom) - default
vim.keymap.set('n', '<C-j>', '<cmd>ToggleTerm direction=horizontal<cr>', { desc = 'Toggle horizontal terminal' })

-- Vertical terminal (right side)
vim.keymap.set('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>', { desc = 'Toggle vertical terminal' })

-- Floating terminal (like VSCode integrated terminal popup)
vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', { desc = 'Toggle floating terminal' })

-- Git shortcuts (using terminal)
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

-- Node REPL
local node = Terminal:new({
  cmd = "node",
  direction = "float",
  close_on_exit = false,
})

function _NODE_TOGGLE()
  node:toggle()
end

-- Python REPL
local python = Terminal:new({
  cmd = "python3",
  direction = "float",
  close_on_exit = false,
})

function _PYTHON_TOGGLE()
  python:toggle()
end

-- Quick terminal commands (like VSCode/Cursor)
vim.keymap.set('n', '<leader>gg', '<cmd>lua _LAZYGIT_TOGGLE()<CR>', { desc = 'LazyGit' })
vim.keymap.set('n', '<leader>tn', '<cmd>lua _NODE_TOGGLE()<CR>', { desc = 'Node REPL' })
vim.keymap.set('n', '<leader>tp', '<cmd>lua _PYTHON_TOGGLE()<CR>', { desc = 'Python REPL' })

-- Quick commands for common terminal tasks
vim.keymap.set('n', '<leader>tr', function()
  vim.cmd('ToggleTerm cmd="npm run dev"')
end, { desc = 'Run npm dev' })

vim.keymap.set('n', '<leader>tb', function()
  vim.cmd('ToggleTerm cmd="npm run build"')
end, { desc = 'Run npm build' })

vim.keymap.set('n', '<leader>tt', function()
  vim.cmd('ToggleTerm cmd="npm test"')
end, { desc = 'Run npm test' })

-- Terminal help
vim.keymap.set('n', '<leader>th', function()
  print([[
🖥️  Terminal - VSCode/Cursor Style:

🎛️  MAIN CONTROLS:
  Ctrl+J        → Toggle terminal (horizontal, bottom)
  <leader>tv    → Toggle vertical terminal (right side)
  <leader>tf    → Toggle floating terminal
  
📁 INSIDE TERMINAL:
  Ctrl+J        → Close terminal
  Esc           → Switch to normal mode
  Ctrl+H/K/L    → Navigate to other windows
  
🚀 QUICK COMMANDS:
  <leader>gg    → LazyGit (amazing Git UI)
  <leader>tn    → Node REPL
  <leader>tp    → Python REPL
  <leader>tr    → npm run dev
  <leader>tb    → npm run build  
  <leader>tt    → npm test

💡 Just like VSCode - run any bash/git commands!
  ]])
end, { desc = 'Show Terminal Help' }) 