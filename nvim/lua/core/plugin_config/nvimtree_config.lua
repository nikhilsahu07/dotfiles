require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,  -- Show dotfiles by default
  },
})

-- Toggle nvim-tree with Ctrl+B (existing keybind)
vim.keymap.set('n', '<c-b>', ':NvimTreeToggle<CR>')

-- Toggle dotfiles visibility with leader+.
vim.keymap.set('n', '<leader>.', function()
  local api = require('nvim-tree.api')
  api.tree.toggle_hidden_filter()
end, { desc = "Toggle dotfiles visibility in nvim-tree" })
