""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Prelude
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
autocmd! bufwritepost .vimrc nested source %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins via Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'
Bundle 'AnsiEsc.vim'
Bundle 'christoomey/vim-sort-motion'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'dag/vim2hs'
Bundle 'dag/vim-fish'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'eagletmt/neco-ghc'
" Bundle 'Floobits/floobits-vim'
Bundle 'idris-hackers/idris-vim'
Bundle 'junegunn/vim-easy-align'
Bundle 'kana/vim-niceblock'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
" Bundle 'trapd00r/neverland-vim-theme'

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shortmess+=I
set title

set ruler
set showcmd
set number
set relativenumber
set cursorline

set backspace=indent,eol,start

set hlsearch
set incsearch
set ignorecase
set smartcase

set showmatch
set mat=2

set noerrorbells
set mouse=a

set wildmenu
set laststatus=2
set noshowmode
set encoding=utf-8

set guioptions-=T "Remove toolbar
set guioptions-=r "Remove right side scrollbar

if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups, and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backup
set backupdir=/tmp
set directory=/tmp

set wildignore+=*.ibc,*.o,*.hi,*.pyc,*.so

set history=700
set undolevels=700

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

set background=dark
colorscheme solarized

set t_Co=256
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wrap
set textwidth=0
set lbr
set display=lastline

set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

au Filetype haskell setl ts=4 sw=4 sts=4

if ! exists("vimpager")
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+$/
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keyboard remappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set pastetoggle=<F2>

" Automatic undo sequence breaks
inoremap <C-U> <C-G>u<C-U>
inoremap <CR> <C-G>u<CR>

nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR>

nmap <leader>a    <Plug>(EasyAlign)
vmap <CR>         <Plug>(EasyAlign)
nmap <leader>A    <Plug>(LiveEasyAlign)
vmap <leader><CR> <Plug>(LiveEasyAlign)

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

nnoremap <leader>h :nohl<CR>

" Relies on vim-eunuch
cmap w!! SudoWrite

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins and utilities
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shell=bash
set grepprg=ag

let g:ctrlp_cmd = 'CtrlPMixed'

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=23
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0

let g:syntastic_auto_loc_list = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='!'

let g:haskell_conceal_enumerations = 0
" let g:haskell_conceal_wide = 1

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#use_vimproc = 1
let g:neocomplete#skip_auto_completion_time = ''

let g:powerline_pycmd = 'py3'

if exists("vimpager")
  let g:indent_guides_enable_on_vim_startup = 0
  set laststatus=1
endif
