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
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'scrooloose/nerdtree'
  Plug 'Zaptic/elm-vim'
call plug#end()

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:coc_snippet_next = '<c-j>'
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> gd :call CocAction('jumpDefinition')<Cr>
nnoremap <silent> gh :call CocAction('doHover')<Cr>
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gy <Plug>(coc-type-definition)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


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
