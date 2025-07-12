require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    globalstatus = true, -- Single statusline for all windows
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = {
      {
        'filename',
        path = 1,
        symbols = {
          modified = ' ●',
          readonly = ' ',
          unnamed = '[No Name]',
        }
      }
    },
    lualine_x = {
      -- Copilot status indicator
      {
        function()
          if vim.g.copilot_enabled_state == true then
            return ' Copilot'
          else
            return ' Copilot'
          end
        end,
        color = function()
          if vim.g.copilot_enabled_state == true then
            return { fg = '#a6e3a1', gui = 'bold' } -- Catppuccin green
          else
            return { fg = '#f38ba8', gui = 'bold' } -- Catppuccin red
          end
        end,
      },
      'encoding',
      'fileformat',
      'filetype'
    },
    lualine_y = { 
      {
        'progress',
        separator = { right = '' },
      }
    },
    lualine_z = { 
      {
        'location',
        separator = { right = '' },
      }
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {
      {
        'buffers',
        show_filename_only = true,
        hide_filename_extension = false,
        show_modified_status = true,
        mode = 0, -- 0: Shows buffer name
        max_length = vim.o.columns * 2 / 3,
        separator = { right = '' },
        buffers_color = {
          active = { bg = '#89b4fa', fg = '#1e1e2e', gui = 'bold' }, -- Catppuccin blue/base
          inactive = { bg = '#313244', fg = '#cdd6f4' }, -- Catppuccin surface0/text
        },
        filetype_names = {
          TelescopePrompt = 'Telescope',
          dashboard = 'Dashboard',
          packer = 'Packer',
          fzf = 'FZF',
          alpha = 'Alpha',
          oil = 'Oil',
        },
        symbols = {
          modified = ' ●',
          alternate_file = '#',
          directory = '',
        },
      }
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        'tabs',
        tab_max_length = 40,
        max_length = vim.o.columns / 3,
        mode = 0,
        path = 0,
        use_mode_colors = false,
        separator = { left = '' },
        tabs_color = {
          active = { bg = '#f9e2af', fg = '#1e1e2e', gui = 'bold' }, -- Catppuccin yellow/base
          inactive = { bg = '#313244', fg = '#cdd6f4' }, -- Catppuccin surface0/text
        },
        show_modified_status = true,
        symbols = {
          modified = ' ●',
        },
      }
    }
  },
  extensions = { 'nvim-tree', 'oil', 'toggleterm' }
}
