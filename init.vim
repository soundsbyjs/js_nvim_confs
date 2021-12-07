" my original vim setup was really, *really broken, and I wanted to put it up on github
" so I went through and customized my totally perfect neovim setup

" This file is formatted like so:

" 1. notes
" 	a basic overview for those (namely myself) wanting to use this vimrc
" 2. personal prefs
" 	these are native configurations of vimrc
" 3. plugins
" 	the plugins section is split up into essentials and aesthetics
" 4. individual configurations
" 	configurations for plugins above, hopefully looking fly

" ////// 1 //////
" notes
" leader key is ,
" open nerdtree with ,n
" you need neovim compiled with python, so do $ pip install neovim
" get yourself a sexy ass font. nerd-fonts-complete on the AUR is baller
" it looks best with a semibold font

" ////// 2 //////
" Personal prefs

set nocompatible  	" Disable compatibility 
filetype on			" Enable type file detection
filetype plugin on 	" Enable plugins and load plugin 
filetype indent on	" Load an indent file for the detected file type.
syntax on			" Syntax highlighting 
set tabstop=4		" Set tab width to 4
set ignorecase		" Ignore capital letters during search.
set smartcase		" ...unless you specify a capital letter
set relativenumber  " lines appear as relative to the cursor
set guicursor=		" makes the cursor not look stupid
set noerrorbells	" no idea what this does
set shiftwidth=4	" ^^
set smartindent		" ^^ but it sounds cool
let mapleader = ","

" ////// 3 //////
" plugins

call plug#begin()
										" ///////////// essentials ////////////////
										
										
Plug 'preservim/NERDTree'				" NERDTree is a file viewer for NERDS
										" note this requires python nvim
										" pip install neovim for that
Plug 'vim-airline/vim-airline'			" lean and mean status & tabline
Plug 'nathanaelkane/vim-indent-guides'	" indentation lines..... but doesn't vim have this built in?
Plug 'jiangmiao/auto-pairs'				" auto pair your brackets for maximum visual studio
Plug 'ycm-core/YouCompleteMe'			" completion engine with a ton of features


										" /////////////   themes   ///////////////

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 	" pwetty colors
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }				" theme
Plug 'vim-airline/vim-airline-themes'							" airline theme

call plug#end()


" ////// 4 //////
" plugin prefs

" NERDTree
" 	toggle nt with ,n
nnoremap <leader>n :NERDTreeToggle<CR>

" YouCompleteMe
" 	some prefs for ycm
let g:ycm_complete_in_strings = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_echo_current_diagnostic = 0
let g:ycm_log_level = 'critical'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" treesitter
" 	treesitter is a syntax highlighting doo dad. it's sometimes kind of slow but
" 	it looks so damn sexy
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,
    disable = { },
  },
}
EOF

" theme
" this theme has a transparent background because I use a full screen terminal
" called guake. You can disable that by deleting the following line,
" but I personally like it so that I can read stuff behind my terminal

let g:tokyonight_transparent = "true"
let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

colorscheme tokyonight

" airline
" the airline theme I chose looks pretty damn  good with tokyonight
let g:airline_theme='atomic'
