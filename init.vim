set nocompatible

" Leader shortcut
let mapleader="," " leader is comma, default is \

" Allow backspace key over anything
set backspace=indent,eol,start

" Encoding
set encoding=utf-8
set fileencoding=utf-8

" Tabs and spaces
" by default, the indent is 4 spaces. 
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" for html/css/ruby/erb/js files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype eruby setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab

" User Interface
set title " set terminal title
set hidden " Allow hiden unsaved buffers
set display=lastline " Show as much as possible of a wrapped last line
"set number " Show line numbers (deactivated for Prose)
filetype indent on " load filetype-specific indent files
set wildmenu " visual autocomplete for command menu
" Always show status bar
"set laststatus=2
set showmode
" Show partial commands in the last line of the screen
set showcmd
" clipboard
"set clipboard=unnamed,unnamedplus
"set clipboard=unnamedplus

" Searching
set incsearch " search as characters are entered
set hlsearch " highlight matches
set ignorecase
set smartcase
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Folding
set foldenable " enable folding

set foldlevelstart=10 " open most folds by default
" space open/closes folds
" nnoremap <space> za

" Plugins
call plug#begin('~/.config/nvim/autoload/')

" solarized colorscheme
Plug 'overcache/NeoSolarized'

" Buffer navigation
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" Status line
Plug 'nvim-lualine/lualine.nvim'

" Git
Plug 'tpope/vim-fugitive'

" Telescope Requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Telescope
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" LSP
Plug 'neovim/nvim-lspconfig'

call plug#end()

" Colors
set termguicolors
syntax on
set background=dark
colorscheme NeoSolarized

" Airline
"let g:airline_theme='solarized'
"let g:airline_solarized_bg='dark'
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#formatter = 'default'

" powerline fonts
"let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
"let g:airline_symbols.space = "\ua0"
let g:airline_symbols.maxlinenr= ''
let g:airline_symbols.maxcolumnnr= ''

" better copy/paste
xnoremap <leader>p "_dP 
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y


" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>Telescope grep_string<cr>

"Remove all trailing whitespace 
nnoremap <leader>ws :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

lua require("jtorrents") 
