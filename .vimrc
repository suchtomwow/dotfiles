call plug#begin('~/.local/share/nvim/plugged')
  Plug 'bumaociyuan/vim-swift'
  Plug 'elixir-editors/vim-elixir'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'powerline/powerline'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-session'
  Plug 'sheerun/vim-polyglot'
call plug#end()

let g:python_host_prog = '/usr/bin/python'

set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set number
set autoread
let g:session_autoload = 'no'

" Convenience
inoremap {<CR>  {<CR>}<Esc>O

" Map the leader key to SPACE
let mapleader="\<SPACE>"

" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>
" Quick edit/reload this configuration file
nnoremap <Leader>ev :e $MYVIMRC<CR>
nnoremap <Leader>sv :so $MYVIMRC<CR>

" Settings for Airline
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_skip_empty_sections = 1
let g:airline_theme = 'distinguished'
