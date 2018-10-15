" Neovim init.vim
" author: Michael Farrell
" contact: michaeldavidfarrell@gmail.com
" date: Oct 15 2018

" vim-plug plugin manager
call plug#begin('~/.config/nvim/plugged')

" Typing
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Multi-entry selection UI. FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Utils
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/a.vim'
Plug 'airblade/vim-gitgutter'

" Style
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'

call plug#end()

"""""""" Custom Settings """"""""""""""
" syntax highlighting and filetype specific features
syntax on
filetype on
filetype plugin on
filetype indent on

" Always copy and paste to clipboard
set clipboard+=unnamedplus

" Use xclip for clipboard
" sudo apt install xclip
let g:clipboard = {
  \   'name': 'xclip-xfce4-clipman',
  \   'copy': {
  \      '+': 'xclip -selection clipboard',
  \      '*': 'xclip -selection clipboard',
  \    },
  \   'paste': {
  \      '+': 'xclip -selection clipboard -o',
  \      '*': 'xclip -selection clipboard -o',
  \   },
  \   'cache_enabled': 1,
  \ }

" Colorscheme
set termguicolors
let g:gruvbox_contrast_dark="hard"
set background=dark
colorscheme gruvbox

" Be improved
set nocompatible

" Relative line numbering with absolute line number on current line
set relativenumber
set number

" Show gutter
set signcolumn=yes

" Always display status bar
set laststatus=2

" swp files are the worst, disable them
set nobackup
set noswapfile

" dont highlight search, no incremental search
set nohls
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

" tabs are four spaces, smart tabbing
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

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

" Don't assume I want a line comment after another line comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"""""""" Custom Keys """"""""""""""
" Set space for the leader
let mapleader = "\\"
nmap <space> <leader>
vmap <space> <leader>

" Escape Mappings for insert and visual modes
inoremap jk <esc>
vnoremap jk <esc>

" Mappings to move up and down faster
nnoremap J 10j
nnoremap K 10k
vnoremap J 10j
vnoremap K 10k

" Mappings to edit .vimrc/init.vim and source/save .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Cpp stuff: nice curly braces
inoremap {<CR> {<CR>}<Esc>ko

" Clang-format
map <C-K> :pyf /usr/share/clang/clang-format-3.8/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/clang/clang-format-3.8/clang-format.py<cr>

""""""""""" Plugins """"""""""""""""""
" Language Client
let g:LanguageClient_serverCommands = {
    \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
    \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
    \ 'python': ['pyls', '--log-file=/tmp/pyls.log'],
    \ }

" Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = '/home/mmmfarrell/.config/nvim/settings.json'
set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1
" Scroll through autocomplete options with Tab
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" UltiSnips
" Ctrl + j to expand snippets and Ctrl+j/Ctrl+k to move forward, back
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" NerdTree
" Start nerdtree if start vim with no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open/Close NerdTree with Ctrl + N
map <C-n> :NERDTreeToggle<CR>

" VimAirline
" Note: If symbols don't appear install them with
" `sudo apt install fonts-powerline` Ubuntu
let g:airline_powerline_fonts = 1
let g:airline_theme = "dark"

" Tmuxline
" Note: this plugin is used to generate pretty formats for tmux that are saved
" and then loaded by tmux on startup. That way your tmux always looks nice, not
" just after you start vim.
let g:airline#extensions#tmuxline#enabled = 0
