
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'preservim/vim-markdown'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'neovim/nvim-lspconfig'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'voldikss/vim-floaterm'
  use 'windwp/nvim-autopairs'
  use 'lukas-reineke/indent-blankline.nvim'

  -- Completion framework
  use 'hrsh7th/nvim-cmp' 
 
  -- LSP completion source:
  use'hrsh7th/cmp-nvim-lsp'
 
  -- Useful completion sources:
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/vim-vsnip'
 
  -- Inlay hints
  use 'lvimuser/lsp-inlayhints.nvim'

  -- Themes
  use 'sainnhe/gruvbox-material'

  -- lualine
  use 'nvim-lualine/lualine.nvim'
end)
