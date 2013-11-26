""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Prelude
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
autocmd! bufwritepost .vimrc source %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins via Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

" Bundle 'Floobits/floobits-vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'dag/vim2hs'
Bundle 'idris-hackers/idris-vim'
Bundle 'junegunn/vim-easy-align'
Bundle 'kien/ctrlp.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/syntastic'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'trapd00r/neverland-vim-theme'

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shortmess+=I
set title

set ruler
set showcmd
set number

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

set history=700
set undolevels=700

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

colorscheme neverland

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

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keyboard remappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set pastetoggle=<F2>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
vnoremap <leader>a  :EasyAlign<CR>
vnoremap <leader><CR>  :LiveEasyAlign<CR>

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" Relies on vim-eunuch
cmap w!! SudoWrite

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins and utilities
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set grepprg=ack

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=239

let g:syntastic_auto_loc_list = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='!'

let g:ycm_allow_changing_updatetime = 0

let g:haskell_conceal_enumerations = 0
" let g:haskell_conceal_wide = 1
