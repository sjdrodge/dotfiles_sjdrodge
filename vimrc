""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Prelude
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
autocmd! bufwritepost .vimrc nested source %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins via vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-sort-motion'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-niceblock'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

if !exists('g:vscode')
  Plug 'altercation/vim-colors-solarized'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'dense-analysis/ale'
  Plug 'eagletmt/neco-ghc'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'itchyny/lightline.vim'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'sheerun/vim-polyglot'
  Plug 'vim-scripts/AnsiEsc.vim'

  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
  endif
endif

call plug#end()

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

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

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

" nmap <C-j> <C-w>j
" nmap <C-k> <C-w>k
" nmap <C-h> <C-w>h
" nmap <C-l> <C-w>l

nnoremap <leader>h :nohl<CR>

" Relies on vim-eunuch
cmap w!! SudoWrite

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins and utilities
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shell=zsh
if executable('rg')
    set grepprg=rg
endif

let g:ctrlp_cmd = 'CtrlPMixed'

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=23
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0

let g:ale_fixers = {
\   'rust': ['rustfmt'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'json': ['prettier'],
\   'jsonc': ['prettier'],
\}

let g:ale_fix_on_save = 1

let g:haskell_conceal_enumerations = 0
" let g:haskell_conceal_wide = 1

let g:deoplete#enable_at_startup = 1

if exists("vimpager")
  let g:indent_guides_enable_on_vim_startup = 0
  set laststatus=1
endif
