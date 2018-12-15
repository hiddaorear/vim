"
"@Yifeng Wang
"2015-06-28
"github:hiddaorear
"

" {{{{{
syn on
syntax on " 打开语法高亮
set nocompatible " 不与 Vi 兼容
" General {{{
"au BufWinEnter * silent! loadview
"au BufWinLeave * silent! mkview
"autocmd! bufwritepost .vimrc source %
set autochdir " 自动切换工作目录
set showmode " 底部显示插入模式还是命令模式
set showcmd " 显示当前键入的指令
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
set noerrorbells " 忽略出错响声
set visualbell " 出错时视觉提示，屏幕闪烁
set history=1000 " vim记住历史操作次数
" }}}


" File {{{
set nowritebackup  " only in case you don't want a backup file while editing
set noundofile     " no undo files
set nobackup
set noswapfile
set autoread " 编辑过程中，文件发生外部改变，提示之
set hidden " 不自动保存，切换buffer时不被打断；autowriteall，自动保存
" }}}


" Lang & Encoding {{{
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set encoding=utf-8
set langmenu=en_US
let $LANG = 'en_US.UTF-8'
" }}}


" GUI {{{
set background=light
colorscheme  solarized "  torte solarized molokai phd ron evening pablo desert
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set cursorcolumn " 高亮显示光标所在的行和列
set cursorline
set hlsearch

autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
set numberwidth=2

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
set guifont=Monaco:h16
set go-=r " 去除左右滚动条
set go-=L
set scrolloff=8 " 光标移动到buffer顶部或底部时，保持8行的距离

set colorcolumn=85
set t_Co=256 "terminal color,因terminal的vim只支持16色，设定vim使用256色
set mouse=a " || a,非a值则使用系统的标准选取、复制，使用Ctrl+c:w
set ruler " 右下角显示状态说明，行号之类
set linespace=2 " Number of pixel lines inserted between characters.
set laststatus=2 " 总是显示状态行
set list " 列表选项，显示行尾字符($)和未扩展标签(^I)，行尾空白
set listchars=tab:»■,trail:■ " 多余行尾空格，显示为可见的小方块

set wrap " 自动换行
set wrapmargin=2 " 折行处与编辑窗口右边缘之间空出的字符数
set cmdheight=1 " 命令行高度
" }}}


" Format {{{
set autoindent
set smartindent
set expandtab
set foldenable " 开始折叠
set foldmethod=syntax
set foldcolumn=0 " 折叠区域的宽度
set foldlevel=1 " 折叠层数
set foldlevelstart=99 " 打开文件默认不折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>   " 用空格开关折叠

set tabstop=4
set shiftwidth=4
set softtabstop=4

" }}}


" Coding {{{
set complete+=k " 计划拼写字典自动补全
set wildmenu " 命令模式下不全以菜单形式显示
set wildmode=list:longest,full    "bash shell complete
" }}}

" }}}}}

" Leader {{{
" let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>1
" }}}



" {{{{{
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" UI
Plugin 'flazz/vim-colorschemes'
Plugin 'luochen1990/rainbow'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'kshenoy/vim-signature'
Plugin 'liuchengxu/vim-which-key'

" FILE
Plugin 'scrooloose/nerdtree'

" SEARCH
Plugin 'rking/ag.vim'
Plugin 'ctrlpvim/ctrlp.vim'

" EDITOR
Plugin 'easymotion/vim-easymotion'
Plugin 'mbbill/undotree'
Plugin 'ervandew/supertab'
Plugin 'junegunn/goyo.vim'

" CODING
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-scripts/gitignore'

" JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'maksimr/vim-jsbeautify'

call vundle#end()
filetype plugin indent on

" }}}}}



"Plugin {{{{{

 "UI liuchengxu/vim-which-key {{{
let g:mapleader = "\<Space>"
let g:maplocalleader = ","

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey ','<CR>

let g:which_key_map =  {}

" `name` 是一个特殊字段，如果 dict 里面的元素也是一个 dict，那么表明一个 group，比如 `+file`, 就会高亮和显示 `+file` 。默认是 `+prefix`.

" =======================================================
" 基于已经存在的快捷键映射，直接使用一个字符串说明介绍信息即可
" =======================================================
" You can pass a descriptive text to an existing mapping.

let g:which_key_map.f = { 'name' : '+file' }

nnoremap <silent> <leader>fs :update<CR>
let g:which_key_map.f.s = 'save-file'

nnoremap <silent> <leader>fd :e $MYVIMRC<CR>
let g:which_key_map.f.d = 'open-vimrc'

nnoremap <silent> <leader>oq  :copen<CR>
nnoremap <silent> <leader>ol  :lopen<CR>
let g:which_key_map.o = {
      \ 'name' : '+open',
      \ 'q' : 'open-quickfix'    ,
      \ 'l' : 'open-locationlist',
      \ }

" =======================================================
" 不存在相关的快捷键映射，需要用一个 list：
" 第一个元素表明执行的操作，第二个是该操作的介绍
" =======================================================
" Provide commands(ex-command, <Plug>/<C-W>/<C-d> mapping, etc.) and descriptions for existing mappings
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
      \ }

let g:which_key_map.l = {
      \ 'name' : '+lsp'                                            ,
      \ 'f' : ['LanguageClient#textDocument_formatting()'     , 'formatting']       ,
      \ 'h' : ['LanguageClient#textDocument_hover()'          , 'hover']            ,
      \ 'r' : ['LanguageClient#textDocument_references()'     , 'references']       ,
      \ 'R' : ['LanguageClient#textDocument_rename()'         , 'rename']           ,
      \ 's' : ['LanguageClient#textDocument_documentSymbol()' , 'document-symbol']  ,
      \ 'S' : ['LanguageClient#workspace_symbol()'            , 'workspace-symbol'] ,
      \ 'g' : {
        \ 'name': '+goto',
        \ 'd' : ['LanguageClient#textDocument_definition()'     , 'definition']       ,
        \ 't' : ['LanguageClient#textDocument_typeDefinition()' , 'type-definition']  ,
        \ 'i' : ['LanguageClient#textDocument_implementation()'  , 'implementation']  ,
        \ },
      \ }

call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>


"}}}



"UI  luochen1990/rainbow  {{{
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}
" }}}


"SEARCH  rking/ag.vim {{{
"let g:ag_prg="<custom-ag-path-goes-here> --vimgrep"
"let g:ag_working_path_mode="r"
" }}}

"SEARCH ctrlp {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']
let g:ctrlp_switch_buffer = 'et'
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
 let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'], }
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows


let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=150
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

let g:ctrlp_max_depth = 40
"let g:ctrlp_max_files = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:100'
" search by file name
let g:ctrlp_by_filename = 1
" }}}

"FILE nerdtree {{{
"autocmd VimEnter * NERDTree
map <F3> :NERDTreeToggle<CR>
let NERDTreeWinPos="right"
let NERDTreeShowBookmarks=1
let g:NERDTreeChDirMode = 2
" }}}

""FILE netrw {{{
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" }}}


" CODING scrooloose/syntastic {{{
let g:syntastic_error_symbol = '✗'	"set error or warning signs
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
let g:syntastic_enable_balloons = 1	 "whether to show balloons

" }}}

"JavaScript pangloss/vim-javascript {{{
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
set foldmethod=syntax
"let g:javascript_conceal_function             = "ƒ"
"let g:javascript_conceal_null                 = "ø"
" }}}

"JavaScript  maksimr/vim-jsbeautify {{{
"".vimrc.vimr
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
".vimrc
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

"}}}

"EDTOR mbbill/undotree {{{
nnoremap <Leader>u :UndotreeToggle<CR>
" If undotree is opened, it is likely one wants to interact with it.
let g:undotree_SetFocusWhenToggle=1
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif
" }}}



"UI severin-lemaignan/vim-minimap {{{
let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>gc'
let g:minimap_toggle='<leader>gt'
let g:minimap_highlight='Visual'
" }}}



"EDITOR easymotion/vim-easymotion {{{
" 更改快捷键
map f <Plug>(easymotion-prefix)
map ff <Plug>(easymotion-s2)
map fs <Plug>(easymotion-s)
map fs <Plug>(easymotion-f)
map fl <Plug>(easymotion-lineforward)
map fj <Plug>(easymotion-j)
map fk <Plug>(easymotion-k)
map fh <Plug>(easymotion-linebackward)
map ft <Plug>(easymotion-t2)
" 忽略大小写
let g:EasyMotion_smartcase = 1
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
