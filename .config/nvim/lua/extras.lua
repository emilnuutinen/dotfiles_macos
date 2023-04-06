-- Telescope settings
require('telescope').load_extension('fzy_native')
require("telescope").load_extension('file_browser')

local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    layout_config = {
      horizontal = {
            height = 0.9,
            preview_cutoff = 160,
            prompt_position = "bottom",
            width = 0.9
      }
    },
    mappings = {
      i = {
        ["<C-l>"] = actions.select_vertical
      },
      n = {
        ["<C-l>"] = actions.select_vertical
      },
    },
  }
}

-- Autopairs
require("nvim-autopairs").setup {}
local autopairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require("nvim-autopairs.conds")
autopairs.add_rules {
  Rule("<", ">"):with_pair(cond.before_regex("%a+")):with_move(),
}

-- Lualine
local lualine = require('lualine')
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename'},
    lualine_x = {'diagnostics', 'encoding', 'filetype','progress','location'},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
