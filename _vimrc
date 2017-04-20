"
"@Yifeng Wang
"2015-06-28
"github:hiddaorear
"

" {{{{{

" General {{{
set nocompatible
"au BufWinEnter * silent! loadview
"au BufWinLeave * silent! mkview
autocmd! bufwritepost .vimrc source %
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set clipboard=unnamed
set winaltkeys=no
set noeb " no error bells
set ai " auto indent
set bs=2 " 在insert模式下用退格键删除
set showmatch " 设置匹配模式，例如输入左括号会匹配相应的右括号
set isk+=- " 设置-为单词的一部分
set incsearch " 关键字未输入完全即显示结果
set ignorecase " 忽略大小写
set smartcase " 如果有大写字母，则切换到大小写敏感查找
" }}}


" File {{{
set nowritebackup  " only in case you don't want a backup file while editing
set noundofile     " no undo files
set nobackup
set noswapfile
set autoread
set hidden " 不自动保存，切换buffer时不被打断；autowriteall，自动保存
" }}}


" Lang & Encoding {{{
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set encoding=utf-8
set langmenu=en_US
let $LANG = 'en_US.UTF-8'
"language messages zh_CN.UTF-8
" }}}


" GUI {{{
colorscheme Tomorrow-Night-Bright "torte solarized molokai phd ron evening pablo desert
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set cursorcolumn " 高亮显示光标所在的行和列
set cursorline
set hlsearch

autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
set numberwidth=4

" 窗口大小
"set lines=35 columns=140
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
set guifont=Consolas:h14:cANSI
set go-=r " 去除左右滚动条
set go-=L
set scrolloff=8 " 光标移动到buffer顶部或底部时，保持8行的距离

set colorcolumn=85
set t_Co=256 "terminal color,因terminal的vim只支持16色，设定vim使用256色
set mouse=r " || a,非啊值则使用系统的标准选取、复制，使用Ctrl+c:w
set ruler " 右下角显示状态说明，行号之类
set linespace=6 " Number of pixel lines inserted between characters.
set laststatus=2 " 总是显示状态行
set list " 列表选项，显示行尾字符($)和未扩展标签(^I)，行尾空白
set listchars=tab:>-,trail:-   " 未扩展标签显示为>-，行尾空白为-

set wrap " 自动换行
set cmdheight=1 " 命令行高度
" }}}


" Format {{{
set autoindent
set smartindent
set expandtab
set foldenable " 开始折叠
set foldmethod=syntax
set foldcolumn=3 " 折叠区域的宽度
set foldlevel=1 " 折叠层数
set foldlevelstart=99 " 打开文件默认不折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>   " 用空格开关折叠

set tabstop=4
set shiftwidth=4
set softtabstop=4

syn on
syntax on
" }}}


" Coding {{{
set complete+=k
set wildmenu " 命令模式下不全以菜单形式显示
set wildmode=list:longest,full    "bash shell complete
" }}}

" }}}}}



" {{{{{
filetype off                  " required

set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
let path='$VIM/Vimfiles/bundle'
call vundle#begin(path)
" alternatively, pass a path where Vundle should install plugins

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-scripts/L9'

"Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
"Plugin 'walm/jshint.vim'

call vundle#end()
filetype plugin indent on

" }}}}}


"Plugin {{{{{

" ctrlp {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

" }}}

" nerdtree {{{
autocmd VimEnter * NERDTree
let NERDTreeWinPos="right"
let NERDTreeShowBookmarks=1
" }}}

" }}}}}



" Function {{{{{

" Remove trailing whitespace when writing a buffer, but not for diff files.
function! RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()

" }}}}}
