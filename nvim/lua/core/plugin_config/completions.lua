local cmp = require("cmp")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  -- Performance optimizations
  performance = {
    debounce = 60,
    throttle = 30,
    fetching_timeout = 500,
    confirm_resolve_timeout = 80,
    async_budget = 1,
    max_view_entries = 200,
  },
  mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-o>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      -- Smart Tab handling - prioritize Copilot, fallback to completion
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback() -- This will trigger Copilot's Tab mapping
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'copilot', group_index = 2 },
    { name = 'nvim_lsp', group_index = 2 },
    { name = 'luasnip', group_index = 2 },
  }, {
    { name = 'buffer', max_item_count = 10 },
  }),
  formatting = {
    format = function(entry, vim_item)
      -- Professional VS Code-like icons
      local kind_icons = {
        Copilot = "",
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      }
      
      -- Get icon for the kind
      local icon = kind_icons[vim_item.kind] or ""
      vim_item.kind = string.format('%s %s', icon, vim_item.kind)
      
      -- Source with professional styling
      vim_item.menu = ({
        copilot = "[Copilot]",
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
      })[entry.source.name]
      
      -- Truncate long completion items
      if string.len(vim_item.abbr) > 50 then
        vim_item.abbr = string.sub(vim_item.abbr, 1, 50) .. "..."
      end
      
      return vim_item
    end
  },
  -- Clean completion window styling
  window = {
    completion = {
      border = "rounded",
      winhighlight = "Normal:CmpPmenu,CursorLine:CmpPmenuSel,Search:None",
      max_width = 80,
      max_height = 20,
      col_offset = -3,
      side_padding = 1,
    },
    documentation = {
      border = "rounded",
      winhighlight = "Normal:CmpDoc",
      max_width = 80,
      max_height = 15,
    },
  },
  -- Enhanced completion behavior
  completion = {
    completeopt = 'menu,menuone,noselect',
  },
  -- Better completion experience
  experimental = {
    ghost_text = false, -- Disable since we're using Copilot
  },
})

-- Professional completion window styling
vim.cmd[[highlight CmpPmenu ctermfg=15 ctermbg=0 guifg=#c5c5c5 guibg=#202020]]
vim.cmd[[highlight CmpPmenuSel ctermfg=0 ctermbg=4 guifg=#000000 guibg=#007acc]]
vim.cmd[[highlight CmpDoc ctermfg=15 ctermbg=0 guifg=#c5c5c5 guibg=#1a1a1a]]

-- Additional VS Code-like styling
vim.cmd[[highlight CmpItemAbbrDeprecated ctermfg=7 ctermbg=NONE guifg=#7C6F64 guibg=NONE gui=strikethrough]]
vim.cmd[[highlight CmpItemAbbrMatch ctermfg=4 ctermbg=NONE guifg=#4FC1FF guibg=NONE gui=bold]]
vim.cmd[[highlight CmpItemAbbrMatchFuzzy ctermfg=4 ctermbg=NONE guifg=#4FC1FF guibg=NONE gui=bold]]
vim.cmd[[highlight CmpItemMenu ctermfg=6 ctermbg=NONE guifg=#C792EA guibg=NONE gui=italic]]
