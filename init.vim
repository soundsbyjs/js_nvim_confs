" my original vim setup was really, *really broken, and I wanted to put it up on github
" so I went through and customized my totally perfect neovim setup

" This file is formatted like so:

" 1. personal prefs
" 	these are native configurations of vimrc
" 2. plugins
" 	the plugins section is split up into essentials and aesthetics
" 3. individual configurations
" 	configurations for plugins above, hopefully looking fly

" ////// 1 //////
" it looks best with a semibold font

" ////// 2 //////
" Personal prefs with vim's built in schenanigans

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

" ////// 2 //////
" plugins

call plug#begin()

" ///////////// essentials ////////////////
										
										
Plug 'preservim/NERDTree'				" NERDTree is a file viewer for NERDS
										" note this requires python nvim
										" pip install neovim for that
Plug 'vim-airline/vim-airline'			" lean and mean status & tabline
Plug 'nathanaelkane/vim-indent-guides'	" indentation lines..... but doesn't vim have this built in?
" Plug 'ycm-core/YouCompleteMe'			" completion engine with a ton of features
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'

" /////////////   themes   ///////////////

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 	" pwetty colors
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }				" theme
Plug 'vim-airline/vim-airline-themes'							" airline theme

" ///////////// bells/whistles /////////
call plug#end()


" ////// 3 //////
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
" called guake. You can disable that by deleting the following lines,
" but I personally like it so that I can read stuff behind my terminal

let g:tokyonight_transparent = "true"
let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

colorscheme tokyonight

" airline
" the airline theme I chose looks pretty damn  good with tokyonight
" it's the same color scheme as the AWP asimov from CS:GO >:)
let g:airline_theme='atomic'

" pairs
let g:AutoPairsFlyMode = 0
" this hecker right HERE gave me so much trouble
" cuz auto-pair would jump lines
let g:AutoPairsMultilineClose = 0



" coc-nvim
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
