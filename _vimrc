"
"@hiddaorear
"2015-06-28
"github:hiddaorear
"



" {{{{{

" General {{{
set nocompatible
set nobackup
set noswapfile
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set clipboard=unnamed
set winaltkeys=no
" }}}

" Lang & Encoding {{{
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set encoding=utf-8
set langmenu=zh_CN
let $LANG = 'en_US.UTF-8'
"language messages zh_CN.UTF-8
" }}}


" GUI {{{
colorscheme Tomorrow-Night-Bright "torte solarized molokai phd ron evening pablo desert
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set cursorline
set hlsearch

autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
set numberwidth=4

" 窗口大小
set lines=35 columns=140
" 分割出来的窗口位于当前窗口下边/右边
set splitbelow
set splitright

"不显示工具/菜单栏
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=b
" 使用内置 tab 样式而不是 gui
set guioptions-=e
set nolist
set guifont=Inconsolata:h12:cANSI
" }}}

" Format {{{
set autoindent
set smartindent
set expandtab
set foldmethod=indent

set tabstop=4
set shiftwidth=4
set softtabstop=4

syn on
syntax on
" }}}


" common conf {{
set noeb
set ai
set bs=2
set showmatch


set colorcolumn=85
set t_Co=256
set cursorcolumn
set mouse=a
set ttyfast
set ruler
set linespace=6

set foldenable
set foldcolumn=3
set foldlevel=1
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>
au BufWinEnter * silent! loadview
au BufWinLeave * silent! mkview

set go-=r
set go-=L

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
" }

set scrolloff=3
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
set hls


set complete+=k

set wildmenu

set nowritebackup  " only in case you don't want a backup file while editing
set noundofile     " no undo files
set autoread

set wildmode=longest,list    "bash shell complete
" }}}}}


" {{{{{
filetype off                  " required

set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
let path='$VIM/Vimfiles/bundle'
call vundle#begin(path)
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/L9'

Plugin 'plasticboy/vim-markdown'
"Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'walm/jshint.vim'

call vundle#end()
filetype plugin indent on

" }}}}}


"Plugin {{{{{

" netrw {{{
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 1
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END
" }}}


" ctrlp {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" }}}

" tagbar {{{
nmap <F8> :TagbarToggle<CR>
" }}}

" }}}}}
