set nocompatible          "不要兼容vi
filetype off              "必须的设置：

"Color Settings
set colorcolumn=85           "彩色显示第85行
set t_Co=256                 "设置256色显示
set background=blue
set cursorline               "设置光标高亮显示
set cursorcolumn             "光标垂直高亮
set mouse=a                  "鼠标滚动
set ttyfast
set ruler
set backspace=indent,eol,start
colorscheme morining
color morining
set guifont=DejaVu\ Sans\ Mono\ 14


"vim支持打开的文件编码
set fileencodings=utf-8,ucs-bom,shift-jis,latin1,big5,gb18030,gbk,gb2312,cp936  "文件 UTF-8 编码
" 解决显示界面乱码
set fileencoding=utf-8
set encoding=utf-8      "vim 内部编码
set termencoding=utf-8
set scrolloff=3
set fenc=utf-8
set autoindent
set hidden
set noswapfile
set nowritebackup

"set the menu & the message to English
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"tab setting
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4

set laststatus=2
set undofile "无限undo
set relativenumber  "相对行号 要想相对行号起作用要放在显示行号后面
set wrap "自动换行
set isk+=- "将-连接符也设置为单词

set ignorecase "设置大小写敏感和聪明感知(小写全搜，大写完全匹配)
set smartcase
set incsearch
set showmatch
set hlsearch

set numberwidth=4 "行号栏的宽度

set whichwrap=b,s,<,>,[,]  "让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）

"插移动
imap <c-j> <down>
imap <c-k> <up>
imap <c-l> <right>
imap <c-h> <left>

"===================================================
"修改leader键为逗号
let mapleader=","
imap jj <esc>

"修改vim的正则表达
nmap / /\v
vmap / /\v

"使用tab键来代替%进行匹配跳转
nmap <tab> %
vmap <tab> %

"折叠html标签 ,fold tag
nnoremap <leader>ft vatzf
"使用,v来选择刚刚复制的段落，这样可以用来缩进
nnoremap <leader>v v`]

"使用,w来垂直分割窗口，这样可以同时查看多个文件,如果想水平分割则<c-w>s
nmap <leader>w <c-w>v<c-w>l
nmap <leader>wc <c-w>c
nmap <leader>ww <c-w>w

"tab切换
nmap <leader>t gt
nmap <leader>r gT

"<leader>空格快速保存
nmap <leader><space> :w<cr>

"设置隐藏gvim的菜单和工具栏 F2切换
set guioptions-=m
set guioptions-=T
"去除左右两边的滚动条
set go-=r
set go-=L

"Vundle Settings {
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle "mattn/emmet-vim"
Bundle 'Auto-Pairs'
Bundle 'matchit.zip'
Bundle 'trailing-whitespace'
Bundle 'cakebaker/scss-syntax.vim'
Bundle "pangloss/vim-javascript"
Bundle "othree/html5.vim"
Bundle "beiyuu/vim-bundle-mako"
Bundle "ayang/AutoComplPop"
Bundle "wavded/vim-stylus"
Bundle "mxw/vim-jsx"
Bundle "brettof86/vim-swigjs"

Bundle 'junegunn/vim-easy-align'
  vmap <Enter> <Plug>(EasyAlign)
  nmap <Leader>a <Plug>(EasyAlign)

Bundle "Solarized"
  let g:solarized_termtrans  = 1
  let g:solarized_termcolors = 256
  let g:solarized_contrast   = "high"
  let g:solarized_visibility = "high"

Bundle "ervandew/supertab"
  let g:SuperTabDefaultCompletionType = "<c-n>"

Bundle 'ctrlp.vim'
  let g:ctrlp_cmd = 'CtrlPMRU'
  let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|site_packages\|venv'

Bundle 'Lokaltog/vim-easymotion'
  let g:EasyMotion_smartcase = 0
  let g:EasyMotion_do_mapping = 0 " Disable default mappings
  nmap s <Plug>(easymotion-s)
  nmap S <Plug>(easymotion-s2)
  map <Leader>j <Plug>(easymotion-j)
  map <Leader>k <Plug>(easymotion-k)

Bundle 'The-NERD-tree'
  "设置相对行号
  nmap <leader>nt :NERDTree<cr>:set rnu<cr>
  let NERDTreeShowBookmarks=1
  let NERDTreeShowFiles=1
  let NERDTreeShowHidden=1
  let NERDTreeIgnore=['\.$','\~$']
  let NERDTreeShowLineNumbers=1
  let NERDTreeWinPos=1

Bundle 'The-NERD-Commenter'
  let NERDShutUp=1
  "支持单行和多行的选择，//格式
  map <c-h> ,c<space>

Bundle 'UltiSnips'
  "let g:UltiSnipsExpandTrigger="<c-j>"
  "let g:UltiSnipsJumpForwardTrigger="<c-j>"
  "let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"放置在Bundle的设置后，防止意外BUG
filetype plugin indent on
syntax on
