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
local function getWords()
  local validFileTypes = {md= true, txt = true, markdown = true}

  if validFileTypes[vim.bo.filetype] then
    return vim.fn.wordcount().words .. " words"
  else
    return ""
  end
end

local function progress()
  local cur = vim.fn.line('.')
  local total = vim.fn.line('$')
  return string.format('%2d%%%%', math.floor(cur / total * 100))
end

local function location()
  local line = vim.fn.line('.')
  local col = vim.fn.virtcol('.')
  return string.format('ln %d, col %d', line, col)
end

local custom_gruvbox = require'lualine.themes.custom_gruvbox'

local lualine = require('lualine')
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = custom_gruvbox,
    component_separators = "|",
		section_separators = "",
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'diagnostics', 'diff'},
    lualine_x = {'encoding', 'filetype', { progress }, { location }, { getWords }},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'diagnostics', 'diff'},
    lualine_x = {'encoding', 'filetype', { progress }, { location }, { getWords }},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {}
}
