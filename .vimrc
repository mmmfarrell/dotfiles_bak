" Plugin Management
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'flazz/vim-colorschemes'
Plugin 'lervag/vimtex'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'airblade/vim-gitgutter'
Plugin 'honza/vim-snippets'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'edkolev/tmuxline.vim'
Plugin 'vim-scripts/a.vim'


" Plugins not currently used
"Plugin 'taketwo/vim-ros'
"Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-rhubarb'

" All of your Plugins must be added before the following line
call vundle#end()            " required
set completeopt-=preview

" Escape Mappings for insert and visual modes
inoremap jk <esc>
vnoremap jk <esc>

" Mapping for jumping
nnoremap <S-Tab> <C-O>

" Mappings to move up and down faster
nnoremap J 10j
nnoremap K 10k
vnoremap J 10j
vnoremap K 10k

" Colorscheme
let g:gruvbox_contrast_dark="hard"
set background=dark
colorscheme gruvbox
set t_Co=256 " to get 256 colors if not default

" Set space for the leader
let mapleader = "\\"
nmap <space> <leader>
vmap <space> <leader>

" Be improved
set nocompatible
set relativenumber
set number

" syntax highlighting and filetype specific features
syntax on
filetype on
filetype plugin on
filetype indent on

" Always display status bar
set laststatus=2

" swp files are the worst, disable them
set nobackup
set noswapfile

" Make backspace work right
set backspace=indent,eol,start

" Ctags stuff, map to generate tags
" Note your screen will show ctags output until 
" killed or finished
set tags=~/.tags
map <leader>gen <CR>:!ctags -R -f ~/.tags ~/.<CR>

" Mappings for ctags
" Ctrl + \ - open def in new tab
" Alt + ] - open def in vertical split
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>"

" Mappings for vim tabs
" Ctrl + Left - previous tab
" Ctrl + Right - next tab
" Ctrl + n - new tab
map <C-h> <Esc>:tabprev<CR>
map <C-l> <Esc>:tabnext<CR>
map <C-n> <Esc>:tabnew<CR>

" tabs are four spaces, smart tabbing
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" smart and auto indent
set autoindent
set smartindent

" Show matching brackets
set showmatch

" Wrap long lines
set wrap

" Case insensitive search
set ic

"When 'ignorecase' and 'smartcase' are both on, if a pattern contains an
"uppercase letter, it is case sensitive, otherwise, it is not. For example,
"/The would find only The, while /the would find the or The etc.
set smartcase

" highlight search
set nohls

" Make search act like search in modern browsers
set noincsearch

" Don't redraw while executing macros
set lazyredraw 

" allows pattern matching with special characters
set magic 

" show the cursor position all the time
set ruler   

" 80 character per line
set textwidth=80

" Highlight one column after limit
set colorcolumn=+1

" for clearing search
"nmap <silent> <leader>/ :nohlsearch<CR>

" enable mouse support if we have it
"if has('mouse')
  "set mouse=a
"endif

"set wildmenu" enables a menu at the bottom of the vim/gvim window.
"The meaning of "list:longest,full" is so that when you do completion in the
"command line via tab, these events will happen:
"1. (on the first tab) a list of completions will be shown and the command
"will be completed to the longest common command.
"2. (on second tab) the wildmenu will show up with all the completions that
"were listed before.
"To test it out, type ":spe" and then hit tab once to see 1 and hit tab 
"again to see 2.
set wildmenu
set wildmode=list:longest,full

" Mappings to edit .vimrc and source/save .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Some leftover stuff that might be relvant
"autocmd FileType make set noexpandtab softtabstop=0

augroup cpp
  autocmd!
  set tabstop=2
  set shiftwidth=2
  set nosmartindent
augroup END

augroup py
  autocmd!
  set tabstop=4
  set shiftwidth=4
  set nosmartindent
augroup END

autocmd FileType cpp setlocal ts=2 sts=2 sw=2
au FileType c,cpp setlocal comments-=:// comments+=f://
inoremap {<CR> {<CR>}<Esc>ko

" Clang-format
map <C-K> :pyf /usr/share/clang/clang-format-3.8/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/clang/clang-format-3.8/clang-format.py<cr>

" =============================================================================
" Plugin Config
" =============================================================================

" ===============================================
" YouCompleteMe
" Mapping to edit ~/.vim/.ycm_extra_conf.py
"nnoremap <leader>ycm :vsplit ~/.vim/.ycm_extra_conf.py<cr>
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
nnoremap <c-]> :YcmCompleter GoTo<CR>

" ===============================================
" NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <leader>ex :NERDTree <CR>
let g:netrw_banner = 0
let g:netrw_winsize = 20

" ===============================================
" Remap for latex compiling
nnoremap <leader>ll :w<CR>:!rubber --pdf --warn all %<CR>
nnoremap <leader>lv :!mupdf %:r.pdf &<CR><CR>

" ===============================================
" This is for airline and powerline
" Note: If symbols don't appear install them with
" `sudo apt install fonts-powerline` Ubuntu
let g:airline_powerline_fonts = 1

" ===============================================
" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"
" ===============================================
" Tmuxline
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_theme = 'jellybeans'

