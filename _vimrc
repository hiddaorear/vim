"
"@hiddaorear
"2015-06-28
"github:hiddaorear
"


syn on

set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1



" common conf {{
set noeb
set nocompatible
filetype off
set ai
set bs=2
set showmatch


set colorcolumn=85
set t_Co=256
set cursorline
set cursorcolumn
set mouse=a
set ttyfast
set ruler
set backspace=indent,eol,start
colorscheme pablo  "torte solarized molokai phd ron evening pablo desert 
set linespace=6

set foldenable
set foldcolumn=3
set foldmethod=syntax "indent
set foldlevel=1
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>
au BufWinEnter * silent! loadview
au BufWinLeave * silent! mkview

set guioptions-=m
set guioptions-=T
set go-=r
set go-=L

autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
set numberwidth=4

set list
set listchars=tab:>-,trail:- 

" coding {
set fileencodings=utf-8,ucs-bom,shift-jis,latin1,big5,gb18030,gbk,gb2312,cp936
set fenc=utf-8
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8
" }}

" set the menu & the message to English {
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" }

"tab setting {
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
" }

set scrolloff=3
set autoindent
set hidden

set laststatus=2
set undofile
autocmd! bufwritepost .vimrc source %

set wrap
set isk+=-

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set hls

set whichwrap=b,s,<,>,[,]

set complete+=k
set nocompatible
filetype plugin on

set clipboard=unnamed

set wildmenu

set nobackup       " no backup files
set noswapfile     " no swap files
set nowritebackup  " only in case you don't want a backup file while editing
set noundofile     " no undo files
set autoread


set wildmode=longest,list    "bash shell complete

syntax on
" }}
