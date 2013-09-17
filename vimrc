"disable formatting when pasting
set pastetoggle=<F2>
"no vim compatibility
set nocompatible
"autoreload vimrc
autocmd! bufwritepost .vimrc source %
"allow backspacing over everything in insert mode
set backspace=indent,eol,start
set backup		" keep a backup file
set history=700
set undolevels=700
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" because mouse is mainstream
set mouse=a

" Vundle
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'wincent/Command-T'
Bundle 'tomtom/tcomment_vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'

filetype plugin indent on

syntax on
set ofu=syntaxcomplete#Complete
set hlsearch
set incsearch
set ignorecase
set smartcase
"wrapping like a boss
set wrap                " word wrap
set textwidth=0         "
set lbr                 " line break
set display=lastline    " don't display @ with long paragraphs
"tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set autoindent		" always set autoindenting on

"other stuff takeon somewhere from the net
set shortmess+=I        " disable the welcome screen
set complete+=k         " enable dictionary completion
set completeopt+=longest
set clipboard+=unnamed  " yank and copy to X clipboard
set showmatch           " show matching brackets (),{},[]
set mat=5               " show mathine brackets for 0.5 seconds
"copy/pasting for intend
vmap <c-y> y:call system("xclip -i", getreg("\""))<CR>
nmap <c-p> :call setreg("\"",system("xclip -o"))<CR>p
imap <c-p> <Esc><c-p>a
"remap those omnimenu keys
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent>j <C-R>=OmniPopup('j')<CR>
inoremap <silent>k <C-R>=OmniPopup('k')<CR>
" powerline
set laststatus=2 " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 7

" set number line counting
set number

" set backupdir
set backupdir=/tmp
set directory=/tmp

" indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=239
set grepprg=ack
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

map <C-n> <esc>:bnext<CR>
map <C-m> <esc>:bprevious<CR>

cmap w!! w !sudo tee > /dev/null %

" set colorcheme
colorscheme neverland
