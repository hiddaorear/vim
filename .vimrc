"
"2015-06-28
"github:hiddaorear
"

" {{{{{
syn on
syntax on " 打开语法高亮
set nocompatible " 不与 Vi 兼容
" General {{{
set autochdir " 自动切换工作目录，会影响ctrlp的使用
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


" {{{{{
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" UI
Plug 'flazz/vim-colorschemes'
Plug 'luochen1990/rainbow'
Plug 'severin-lemaignan/vim-minimap'
Plug 'kshenoy/vim-signature'
Plug 'liuchengxu/vim-which-key'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'

" FILE
Plug 'scrooloose/nerdtree'

" SEARCH
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'

" EDITOR
Plug 'easymotion/vim-easymotion'
Plug 'mbbill/undotree'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'

" CODING
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'majutsushi/tagbar'
Plug 'dense-analysis/ale'

Plug 'SirVer/ultisnips'
Plug 'hiddaorear/vim-snippets'

Plug 'voldikss/vim-floaterm'

Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }


" JavaScript

" rust

Plug 'rust-lang/rust.vim'

" mode
Plug 'jceb/vim-orgmode' " org-mode
Plug 'tpope/vim-speeddating' " vim-orgmode的辅助插件

call plug#end()
" }}}}}




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
set background=dark
colorscheme onedark " torte solarized molokai phd ron evening pablo desert
filetype indent on
set paste
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" 设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" for error highlight，防止错误整行标红导致看不清
set spell
set spelllang=en,cjk
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline


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
set macligatures
set guifont=Fira\ Code:h18
set go-=r " 去除左右滚动条
set go-=L
set scrolloff=8 " 光标移动到buffer顶部或底部时，保持8行的距离

set colorcolumn=85
set t_Co=256 "terminal color,因terminal的vim只支持16色，设定vim使用256色
set mouse=a " || a,非a值则使用系统的标准选取、复制，使用Ctrl+c:w
set ruler " 右下角显示状态说明，行号之类
set linespace=2 " Number of pixel lines inserted between characters.
set list " 列表选项，显示行尾字符($)和未扩展标签(^I)，行尾空白
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

set wrap " 自动换行
set wrapmargin=2 " 折行处与编辑窗口右边缘之间空出的字符数
set cmdheight=1 " 命令行高度



" }}}


" Format {{{
set autoindent
set smartindent
set foldenable " 开始折叠
set foldmethod=syntax
set foldcolumn=0 " 折叠区域的宽度
set foldlevel=1 " 折叠层数
set foldlevelstart=99 " 打开文件默认不折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>   " 用空格开关折叠

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab ts=4 sw=4 ai
" }}}


" Coding {{{
set complete+=k " 计划拼写字典自动补全
set wildmenu " 命令模式下不全以菜单形式显示
set wildmode=list:longest,full    "bash shell complete
" }}}

" }}}}}

" find {{{

set path+=**
set wildmenu
set wildignore+=*.zip,*.png,*.jpg,*.gif,*.pdf,*DS_Store*,*/.git/*,*/node_modules/*,*/build/*,package-lock.json,yarn.json

" }}}


" mark {{{
function! Delmarks()
    let l:m = join(filter(
       \ map(range(char2nr('a'), char2nr('z')), 'nr2char(v:val)'),
       \ 'line("''".v:val) == line(".")'))
    if !empty(l:m)
        exe 'delmarks' l:m
    endif
endfunction

nnoremap <F2> call Delmarks()<CR>
" }}}

" Leader {{{
let g:mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

nnoremap <Leader>t :NERDTreeToggle<CR>

nnoremap <Leader>e :Ex<CR>

" fzf
noremap <leader>ll :Files
noremap <leader>b :Buffers<CR>
noremap <leader>fg :GFiles?<CR>
" 自定义支持路径搜索 Rg string path 的意a
noremap <leader>fp :Rgp
noremap <leader>rg :Rg
noremap <leader>frw :Rg -w
" search text
noremap <leader>fl :BLines<CR>
noremap <leader>m :Marks<CR>
noremap <leader>fw :Windows<CR>
noremap <leader>h :History:<CR>
noremap <leader>fc :Commands<CR>

" }}}



"Plug {{{{{
"
 "UI vim-airline/vim-airline {{{
" let g:airline_theme="base16_spacemacs"
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
nnoremap <C-N> :bn<CR>
nnoremap <C-M> :bp<CR>
set t_Co=256
let g:Powerline_symbols = 'fancy'
" }}}

" UI mhinz/vim-startify {{{
let g:startify_files_number = 10
"Open Statify
nnoremap <silent> <F3> :Startify <CR>

" }}}
"end
"}}}
"

"}}}

 "UI liuchengxu/vim-which-key {{{
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

"SEARCH dyng/ctrlsf.vim {{{
nnoremap <C-f> :CtrlSF<Space>
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_context = '-B 5 -A 3'
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_winsize = '50%'
"}}}

"SEARCH fzf {{{
nmap <C-p> :Files<CR>

let g:fzf_action = { 'ctrl-e': 'edit' }
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Rag 支持传入路径搜索(Find matches for "foo" in path /bar/.)，如：ag foo /bar/
command! -bang -nargs=+ -complete=dir Rgp call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using Vim function
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
" }}}

"FILE nerdtree {{{
"autocmd VimEnter * NERDTree
map <F3> :NERDTreeToggle<CR>
let NERDTreeWinPos="right"
let NERDTreeShowBookmarks=1
let g:NERDTreeChDirMode = 2
let NERDTreeShowHidden=1 " 默认显示隐藏文件
" }}}

""FILE netrw {{{
let g:netrw_hide = 1
let g:netrw_liststyle = 1 " 默认的一个文件一行显示的加强版，会有时间戳等信息，2模式为一行会有多个文件，3为tree模式显示
let g:netrw_banner = 0 " 默认横幅显示，设置为不显示
let g:netrw_browse_split = 1 " 控制窗口显示文件：0为当前，1为水平分裂，2为垂直分裂，3为在新tab中打开，4新窗口覆盖原来的窗口
let g:netrw_winsize = 24 " 显示栏宽度
let g:netrw_altv = 1 " 右侧分裂窗口显示
let g:netrw_chgwin = 2
let g:netrw_list_hide = '.*\.swp$' " 隐藏swp后缀的备份文件
let g:netrw_localrmdir = 'rm -rf'
" }}}


" CODING  prabirshrestha/asyncomplete.vim {{{
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1
set completeopt+=preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" }}}

" CODING  majutsushi/tagbar {{{
    nmap <F8> :TagbarToggle<CR>
" }}}


" CODING dense-analysis/ale {{{
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>a :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? '✔ ' : printf(
    \   '%d✗ %d⚡',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

" }}}


" CODING  SirVer/ultisnips {{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}



" CODING  voldikss/vim-floaterm {{{

let g:floaterm_keymap_new = '<Leader>fn'

" Set floaterm window's background to black
hi FloatermNF guibg=black
" Set floating window border line color to cyan, and background to orange
hi FloatermBorderNF guibg=orange guifg=cyan

" }}}


" CODING  rust-lang/rust.vim {{{
let g:rust_clip_command = 'pbcopy'
let g:rustfmt_autosave = 1
" }}}



"EDTOR mbbill/undotree {{{
nnoremap <Leader>u :UndotreeToggle<CR>
" If undotree is opened, it is likely one wants to interact with it.
let g:undotree_SetFocusWhenToggle=1
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif
" }}}


"EDTOR plasticboy/vim-markdown {{{

let g:vim_markdown_math = 1

" }}}

"EDTOR mzlogin/vim-markdown-toc {{{

"Delet unnecessary under structure of generated toc
function RToc()
    exe "/-toc .* -->"
    let lstart=line('.')
    exe "/-toc -->"
    let lnum=line('.')
    execute lstart.",".lnum."g/           /d"
endfunction
"}}}


"UI severin-lemaignan/vim-minimap {{{
let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>gc'
let g:minimap_toggle='<leader>gt'
let g:minimap_highlight='Visual'
" }}}


"EDITOR easymotion/vim-easymotion {{{
noremap <Leader>nr: NR<CR> "Open the current visual selection in a new narrowed window
noremap <Leader>nrw: NR<CR> "(In the narrowed window) write the changes back to the original buffer.
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



" {{{{ statusline begin

set laststatus=2
let fgcolor=synIDattr(synIDtrans(hlID("Normal")), "fg", "gui")
let bgcolor=synIDattr(synIDtrans(hlID("Normal")), "bg", "gui")


" Statusline
" https://github.com/Greduan/dotfiles/blob/76e16dd8a04501db29989824af512c453550591d/vim/after/plugin/statusline.vim

let g:currentmode={
      \ 'n'  : 'N ',
      \ 'no' : 'N·Operator Pending ',
      \ 'v'  : 'V ',
      \ 'V'  : 'V·Line ',
      \ '' : 'V·Block ',
      \ 's'  : 'Select ',
      \ 'S'  : 'S·Line ',
      \ '' : 'S·Block ',
      \ 'i'  : 'I ',
      \ 'R'  : 'R ',
      \ 'Rv' : 'V·Replace ',
      \ 'c'  : 'Command ',
      \ 'cv' : 'Vim Ex ',
      \ 'ce' : 'Ex ',
      \ 'r'  : 'Prompt ',
      \ 'rm' : 'More ',
      \ 'r?' : 'Confirm ',
      \ '!'  : 'Shell ',
      \ 't'  : 'Terminal '
      \}

" 256色对照表: http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
hi User1 cterm=None ctermfg=0 ctermbg=228 guifg=#292b00  guibg=#f4f597
hi User2 cterm=bold ctermfg=250 ctermbg=28 guifg=#112605  guibg=#aefe7B gui=bold
hi User3 cterm=None ctermfg=208 ctermbg=34 guifg=#ff5500 guibg=#7dcc7d
hi User4 cterm=None ctermfg=208 ctermbg=34 guifg=#051d00  guibg=#7dcc7d
hi User5 cterm=None ctermfg=0 ctermbg=228 guifg=#292b00  guibg=#f4f597
hi User6 cterm=None ctermfg=15 ctermbg=42 guifg=#ffffff  guibg=#5b7fbb

" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction


function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return 'Git:'.fugitive#head()
  else
    return ''
endfunction

set statusline=%<%1*[Buf-%n]%* " User1
set statusline+=%2*\ %<%F\ %{ReadOnly()}\ %m\ %w\  " User2 File+path
set statusline+=%=%3*『\ %{exists('g:loaded_ale')?LinterStatus():''}』%* " User3
set statusline+=%4*\ %{GitInfo()} " Git Branch name User4
set statusline+=%5*\ %{FileSize()}\ %* " User5
set statusline+=%6*[\ %{toupper(g:currentmode[mode()])}] " User6 Current mode
set statusline+=%6*\ %P\ %* " User6

" }}}} statusline end


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
