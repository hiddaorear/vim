set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


"
"@hiddaorear
"2015-06-28
"github:hiddaorear
"

"--init set begin---------------------
set nocompatible             "不要兼容vi
filetype off                 "必须的设置：
"--init set end---------------------

"--GUI set begin---------------------
"Color Settings
set colorcolumn=85           "彩色显示第85行
set foldcolumn=3             "可视折叠线索
set foldmethod=syntax        "代码逻辑折叠
set t_Co=256                 "设置256色显示
set background=dark          "使用color solarized
set cursorline               "设置光标高亮显示
set cursorcolumn             "光标垂直高亮
set mouse=a                  "鼠标滚动
set ttyfast
set ruler
set backspace=indent,eol,start
colorscheme evening
color koehler

"设置隐藏gvim的菜单和工具栏 F2切换
set guioptions-=m
set guioptions-=T
"去除左右两边的滚动条
set go-=r
set go-=L

"set number                                    "显示行号
"set relativenumber                            "相对行号 要想相对行号起作用要放在显示行号后面
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
set numberwidth=4                             "行号栏的宽度

set list
set listchars=tab:>-,trail:- "显示tab和空格
"--GUI set end---------------------

"--Language set begin---------------------
"vim支持打开的文件编码
set fileencodings=utf-8,ucs-bom,shift-jis,latin1,big5,gb18030,gbk,gb2312,cp936  "文件 UTF-8 编码
"解决显示界面乱码
set fileencoding=utf-8
set encoding=utf-8            "vim 内部编码
set termencoding=utf-8
set guifont=Courier\ New\:h14:cANSI
set guifontwide=NSimsun\:h14

" set the menu & the message to English
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

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set scrolloff=3
set fenc=utf-8
set autoindent
set hidden
set noswapfile
set nowritebackup
"set encoding=utf-8
"--Language set begin---------------------

"--deed set begin---------------------
set laststatus=2
set undofile                                  "无限undo
autocmd! bufwritepost .vimrc source %         "自动载入配置文件不需要重启

set wrap "自动换行
set isk+=- "将-连接符也设置为单词

"set ignorecase                                "小写全搜，大写完全匹配
set smartcase
"set gdefault
set incsearch
set showmatch
set hlsearch

set complete+=k     "字典补全
set nocompatible
filetype plugin on  "上下文补全


set whichwrap=b,s,<,>,[,]  "让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）

set clipboard=unnamed        "共享剪切板

set wildmenu

"不保存临时文件
set nobackup       " no backup files
set noswapfile     " no swap files
set nowritebackup  " only in case you don't want a backup file while editing
set noundofile     " no undo files

set wildmode=longest,list    "bash shell complete

"关闭bell声音
set noeb

"--deed set end---------------------

syntax on
