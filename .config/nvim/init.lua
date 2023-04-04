require ("extras")

vim.cmd[[

" Plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'preservim/vim-markdown'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'voldikss/vim-floaterm'
Plug 'windwp/nvim-autopairs'
Plug 'lukas-reineke/indent-blankline.nvim'

" Completion framework:
Plug 'hrsh7th/nvim-cmp' 

" LSP completion source:
Plug 'hrsh7th/cmp-nvim-lsp'

"-- Useful completion sources:
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/vim-vsnip'

"-- Inlay hints
Plug 'lvimuser/lsp-inlayhints.nvim'

"-- Themes
Plug 'sainnhe/gruvbox-material'

call plug#end()

let $NVIM_TUI_ENABLE_TRUE_COLOR=1 

"-- Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fc <cmd>Telescope git_commits<cr>
nnoremap <leader>fr <cmd>Telescope spell_suggest<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>

"-- More natural movement
noremap ; l
noremap l k
noremap k j
noremap j h

"-- More natural window movement
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

nnoremap <CR> :noh<CR><CR>

"-- Map arrow keys to move naturally
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk

"-- map leader to Space
nnoremap <SPACE> <Nop>
map <SPACE> <Leader>

"-- Insert bolded text with a timestamp and subject in markdown
imap <silent> <F1> <C-R>=strftime("**[%H:%M]** ")<CR><C-o>:cal cursor(0,13)<CR>
nmap <silent> <F1> i<C-R>=strftime("**[%H:%M]** ")<CR><C-o>:cal cursor(0,13)<CR>

"-- Insert a new todo template
imap <silent> <F2> <C-R>="- [ ] "<CR><C-o>:cal cursor(0,10)<CR>
nmap <silent> <F2> i<C-R>="- [ ] "<CR><C-o>:cal cursor(0,12)<CR>

"-- Insert heading with todays date in markdown
imap <silent> <F3> <C-R>=strftime("### %d-%m-%Y")<CR>
nmap <silent> <F3> i<C-R>=strftime("### %d-%m-%Y")<CR>

" Scroll past lastline
set display+=lastline

" Python tabbing (PEP 8)
au BufNewFile,BufRead *.py set filetype=python 
autocmd filetype python setlocal tabstop=4
autocmd filetype python setlocal softtabstop=4
autocmd filetype python setlocal shiftwidth=4
autocmd filetype python setlocal textwidth=79
autocmd filetype python setlocal expandtab
autocmd filetype python setlocal autoindent
autocmd filetype python setlocal fileformat=unix

" Go tabbing
au BufNewFile,BufRead *.go set filetype=go
autocmd filetype go setlocal tabstop=4
autocmd filetype go setlocal softtabstop=4
autocmd filetype go setlocal shiftwidth=4
autocmd filetype go setlocal expandtab


" vim.opt.theme  
set background=dark
let g:gruvbox_material_background='hard'
let g:gruvbox_material_foreground='original'
let g:gruvbox_material_transparent_background='2'
let g:gruvbox_material_diagnostic_line_highlight='1'
let g:gruvbox_material_diagnostic_virtual_text='colored'
let g:gruvbox_material_spell_foreground='colored'
let g:gruvbox_material_enable_italic='1'
let g:gruvbox_material_enable_bold='0'
let g:gruvbox_material_disable_terminal_colors=1
function! s:gruvbox_material_custom() abort
    highlight! link TSString String
    highlight! link CocSymbolString String
    highlight! link javascriptPropertyNameString String
    highlight! link typescriptStringProperty String
    highlight! link cmakeKWstring String
    highlight! link mkdHeading Yellow
    highlight! link mkdListItem Fg
    highlight! link mkdBold Fg 
    highlight! link mkdCodeDelimiter Green
    highlight! link mkdListItemCheckbox Fg
    highlight! link TSType BlueItalic
    highlight! link TSTypeBuiltin BlueItalic
    highlight! link TSTypeDefinition BlueItalic
    highlight! link TSNamespace PurpleItalic

    let l:palette = gruvbox_material#get_palette('hard', 'original', {'bg0': ['#121212', '0']})

    call gruvbox_material#highlight('String', l:palette.yellow, l:palette.none)
    call gruvbox_material#highlight('markdownH1', l:palette.yellow, l:palette.none, 'bold')
    call gruvbox_material#highlight('markdownH2', l:palette.yellow, l:palette.none, 'bold')
    call gruvbox_material#highlight('markdownH3', l:palette.yellow, l:palette.none, 'bold')
    call gruvbox_material#highlight('markdownH4', l:palette.yellow, l:palette.none, 'bold')
    call gruvbox_material#highlight('markdownH5', l:palette.yellow, l:palette.none, 'bold')
    call gruvbox_material#highlight('markdownH6', l:palette.yellow, l:palette.none, 'bold')
    call gruvbox_material#highlight('htmlH1', l:palette.yellow, l:palette.none, 'bold')
    call gruvbox_material#highlight('htmlH2', l:palette.yellow, l:palette.none, 'bold')
    call gruvbox_material#highlight('htmlH3', l:palette.yellow, l:palette.none, 'bold')
    call gruvbox_material#highlight('htmlH4', l:palette.yellow, l:palette.none, 'bold')
    call gruvbox_material#highlight('htmlH5', l:palette.yellow, l:palette.none, 'bold')
    call gruvbox_material#highlight('htmlH6', l:palette.yellow, l:palette.none, 'bold')
    call gruvbox_material#highlight('SpellBad', l:palette.red, l:palette.none)
    call gruvbox_material#highlight('SpellCap', l:palette.blue, l:palette.none)
    call gruvbox_material#highlight('SpellLocal', l:palette.aqua, l:palette.none)
    call gruvbox_material#highlight('SpellRare', l:palette.purple, l:palette.none)
    call gruvbox_material#highlight('Comment', l:palette.grey0, l:palette.none, 'italic')
    call gruvbox_material#highlight('LspInlayHint', l:palette.bg5, l:palette.none, 'italic')
    call gruvbox_material#highlight('NormalFloat', l:palette.fg1, l:palette.bg0,)
    call gruvbox_material#highlight('FloatBorder', l:palette.bg5, l:palette.bg0,)
    call gruvbox_material#highlight('PMenu', l:palette.fg1, l:palette.bg0,)
    call gruvbox_material#highlight('ErrorFloat', l:palette.red, l:palette.bg0)
    call gruvbox_material#highlight('WarningFloat', l:palette.yellow, l:palette.bg0)
    call gruvbox_material#highlight('InfoFloat', l:palette.blue, l:palette.bg0)
    call gruvbox_material#highlight('HintFloat', l:palette.green, l:palette.bg0)
    call gruvbox_material#highlight('Special', l:palette.blue, l:palette.none)
    call gruvbox_material#highlight('PmenuSel', l:palette.fg1, l:palette.bg5)
    call gruvbox_material#highlight('PmenuSbar', l:palette.none, l:palette.none)
    call gruvbox_material#highlight('PmenuThumb', l:palette.none, l:palette.bg5)
endfunction
    
augroup GruvboxMaterialCustom
    autocmd!
    autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
augroup END
colorscheme gruvbox-material

" Split windows
set fillchars=vert:\│
set splitright
set splitbelow
nnoremap <Leader>=  <C-W>=

" Normal statusline
set statusline=%1*                  " change colors
set statusline+=[%{GetMode()}]      " show mode
set statusline+=%2*                 " change colors
set statusline+=\ %t                " file name
set statusline+=%3*                 " change colors
set statusline+=\ %m                " modified flag
set statusline+=%2*                 " change colors
set statusline+=%=                  " split alignment to right from here
set statusline+=%c/%l               " col/line
set statusline+=\ %y                " show filetype

" statusline for markdown files
function StatuslineMD()
    set statusline=%1*              " change colors
    set statusline+=[%{GetMode()}]  " show mode
    set statusline+=%2*             " change colors
    set statusline+=\ %t            " file name
    set statusline+=%3*             " change colors
    set statusline+=\ %m            " modified flag
    set statusline+=%2*             " change colors
    set statusline+=%=              " split alignment to right from here
    set statusline+=%c:%l/%L        " line X of Y
    set statusline+=\ (%{wordcount().words}\ words)   " Get word count
endfunction

" Get current mode
function! GetMode()
    let l:mode=mode()
    if l:mode==#"n"
      return "NORMAL"
    elseif l:mode==?"v"
      return "VISUAL"
    elseif l:mode==#"i"
      return "INSERT"
    elseif l:mode==#"R"
      return "REPLACE"
    elseif l:mode==?"s"
      return "SELECT"
    elseif l:mode==#"t"
      return "TERMINAL"
    elseif l:mode==#"c"
      return "COMMAND"
    elseif l:mode==#"!"
      return "SHELL"
    endif
endfunction

" Filetype spesific settings
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd filetype markdown setlocal nonumber
autocmd filetype netrw setlocal statusline=%1*%=%l/%L
autocmd filetype markdown setlocal statusline=%{StatuslineMD()}
autocmd filetype markdown setlocal spell spelllang=en
autocmd filetype markdown set textwidth=80
autocmd filetype markdown set colorcolumn=
autocmd filetype markdown set nolist
" Fix wrapping lists with gq
autocmd FileType markdown set comments=fb:*,fb:+,fb:-,n:> indentexpr=

" Use system clipboard
set clipboard+=unnamedplus

highlight FoldColumn guibg=0

" Disable cursor changing in insert mode
set guicursor=

" configure title only show filename and flags
set titlestring=%t\ %r%m titlelen=50

" Statusline colors
hi User1 guibg=NONE guifg=#b8bb26
hi User2 guibg=NONE guifg=#fabd2f
hi User3 guibg=NONE guifg=#fb4934
hi StatusLineTermNC guifg=NONE guibg=NONE

" Format on save
autocmd BufWritePre * lua vim.lsp.buf.format()

" Hide foldcolumn
set foldcolumn=0
]]

vim.g.floaterm_keymap_toggle = '<F12>'
vim.g.floaterm_autoclose = 2

vim.opt.termguicolors = true
vim.opt.completeopt = 'menu,menuone,noselect,noinsert'

vim.opt.signcolumn = 'number'

-- Enable use of the mouse for all modes
vim.opt.mouse = 'a'


-- 1 tab is 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 2
vim.opt.expandtab = true


-- disable folding
vim.opt.foldenable = false

-- Colorcolumn
vim.opt.colorcolumn = {80}

-- Highlight current line number
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'

-- Turn backup off
vim.opt.backup = false
vim.opt.wb = false
vim.opt.swapfile = false

vim.opt.si = true
vim.opt.wrap = true

-- vim.opt.utf8 as standard encoding
vim.opt.encoding = 'utf-8'

-- Ignore casing of normal letters
vim.opt.ignorecase = true

-- Ignore casing when using lowercase letters only
vim.opt.smartcase = true

vim.opt.breakindent = true
vim.opt.linebreak = true

-- Show line nubmers
vim.opt.number = true

-- enable setting title
vim.opt.title = true


-- Always display the status line, even if only one window is displayed
vim.opt.laststatus = 3


-- Config for vim-markdown
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0
vim.g.vim_markdown_math = 1
vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_strikethrough = 1
vim.g.vim_markdown_autowrite = 1
vim.g.vim_markdown_edit_url_in = 'tab'
vim.g.vim_markdown_new_list_item_indent = 0
vim.g.vim_markdown_auto_insert_bullets = 0
vim.g.tex_conceal = ""
vim.g.vim_markdown_math = 1
vim.g.vim_markdown_frontmatter = 1

-- File explorer
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 20

