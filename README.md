# 关于vim的思考

我用过vim、emacs，以及WebStorm和VS Code。我认为工具应当用其所长。

用他的优点，有缺点用其他工具补充。vim性能好，编辑快捷。有段时间，我工作的电脑是一台MacBook Air，用IDE吃力，操作起来不流畅。用vim做Web前端开发够用。Web前端很简单，我大概用没有安装额外的插件的vim工作了三年。现在想来，未免觉得鲁莽可笑。

这里插件和配置的取舍的原则是：便捷优先，尽量简洁。要简洁，airline这样装饰性的插件，弃用。格式化和lint之类的插件，个人体验了一下，不如IDE，这部分功能使用IDE的功能即可。同样，重构代码的功能，以目前的配置，也不如WebStorm，涉及这部分功能就用WebStorm替代。

文本编辑非常重要的点：
1. 搜索
2. 编辑

找到要编辑的文件，然后找到要编辑的文本字符。这是一个从大到小的过程。查找主要是搜索，目录、文件和字符搜索。定位到具体编辑的稳步，依赖光标的移动。


# 搜索(思路：先大后小，先文件，后字符)

## 缓冲区

`:ls`查看缓冲区，可以看到编号以及其稳健，按回车不能进入对应文件，buffer列表会消失。`buffer num`切换到num编号对应的文件，`buffer dir/filename`也可以切换buffer，按tab键可以补全。也可以用缩写`buf`。

|command|用途|
|:---|---:|
|`bnext` `bn`  | 下一个缓冲区  |
|`bprevious` `bp`  | 上一个  |
|`blast` `bl` | 最后一个 |
|`bfirst` `bf`  | 第一个个 |


## 文件搜索

### fzf

快捷键，取代 CtrlP 插件

Ctrl + p 查看文件列表
Ctrl + e 查看当前 Buffer，两次 Ctrl + e 快速切换上次打开的 Buffer

``` vimscript
nmap <C-p> :Files<CR>
nmap <C-e> :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit' }
```

### ctrlp(路径以及文件名) 注：fzf替代了ctrlp

按键绑定: Ctrl-p

提示面板操作:
1. tab: 自动补全提示面板中的当前工作路径的目录名
2. ctrl-d: 全路径搜索和文件名搜索间切换。文件名搜索模式的提示符是'>d>'，而非'>>>'
3. ctrl-r: 字符串搜索和正则搜索切换。正则模式提示符是'r>>'，而不是'>>>'

选择搜索结果:
1. ctrl-j ctrl-k: 向下与向上移动
2. ctrl-a ctrl-e: 移动到提示面板的开头和结尾

浏览输入历史:
1. ctrl-n ctrl-p: 搜索历史中的下一个字符串和上一个字符串

打开文件:
1. ctrl-r(current): 当前窗口打开选择的文件
2. ctrl-t: 新tab打开
3. ctrl-v: 竖直分割窗口
4. ctrl-s: 水平分割窗口

### Explore
1. Enter:当前窗口打开文件，o:新建窗口打开文件
2. R:重命名
3. D:删除
4. /: 文件列表查找
4. gf: 打开光标所在的文件名对应的文件

### nerdtree

自定义按键绑定: F3

#### 新建目录或文件

- 在NerdTree窗口中，按`m`，底部出现菜单。选择a，添加子节点。如果输入目录，在最后添加`/`，否则将创建文件。支持添加不存在的目录和文件，如`dir/fileName.md`

- `h`更新目录。在未使用vim新建文件的情况刷新列表。


## 字符串全局搜索

### ag.vim(文件中的字符串)

usage:
1. : Ag [options]{pattern}[{directory}]

quickfix window:
1. o: to open(same as enter)
2. go: to preview file(open but maintain focus on ag.vim results)
3. t: to open in new tab
4. T: to open in new tab silently
5. h: to open in horizontal split
6. H: to open in horizontal split silently
7. v: to open in vertical split silently
8. gv: to open in vertical split silently
9. q: to close the quickfix window


# 光标定位

## 光标操作

- `zz` 当前行居中
- `gd` 查找当前单词
- `Ctrl-o` 光标返回以前的位置，相当于光标移动的撤销
- `Ctrl-i` 光标返回后来的位置，相当于光标移动的恢复

## mark

手动设置的mark:

|command|用途|
|:---|---:|
|m  | 标记 |
|``m`  | 跳转到标记 |
|`:marks`  |列出所有标记 |
|`:delmarks mark_name`  | 删除对应的标记 |
|`delmakrs!`  |删除所有标记  |


自带特殊的mark(作用存疑，待验证):

|command|用途|
|:---|---:|
|`.`  |最近编辑位置 |
|0-9  |最近使用文件 |
|`^`  |最近插入位置 |
|```  |上一次跳转前位置 |
|`"`  |上一次退出文件位置 |
|`[`  |上一次修改开始处 |
|`]`  |上一次修改结束处  |

## 根据搜索定位

### easymotion/vim-easymotion
自定义按键绑定: prefix为f，ff为easymotion-s2，根据两个字符搜索定位，大部分场景下能快速定位

## 根据changelist定位
1. `g;`和`g,`在changelist中来回跳转

## 根据jumplist定位
1. ctrl-o ctrl-i在jumplist中来回跳转
2. ctrl-O ctrl-I在文件中trace光标

## 文本搜索
1. gd比`/`与`?`更方便

# 快速编辑

## 修改的历史中搜索

### undotree

自定义按键绑定: leader键为空格，undotree绑定在u(undo)上

## ervandew/supertab(tab键补全)

## Instert模式
1. ctrl-d，ctrl-t 左右缩进
2. ctrl-w 删除
3. ctrl-u 重新编辑

## 补全

- 撤销补全，按`Ctrl-p`到最初的，即没有补全的状态。或者，`Ctrl-u`撤销所有此次的输入（不止含有这个单词的输入，危险操作）
- `Ctrl-n`，在insert模式下，vim会搜索这个目录下的代码，显示一个下拉列表
- `Ctrl-x Ctrl-l`，整行补齐，常用于import等，补齐之后修改即可
- `Ctrl-x Ctrl-f`，文件名补齐，用于import等。默认为全局目录，可以使用`./`开始，使之定位到当前目录
- `Ctrl-x Ctrl-p` `Ctrl-x Ctrl-n`，当前文件中的关键字
- `Ctrl-x Ctrl-o` 基于语义的补全


## 文件操作

### 只读与可编辑切换

- 只读`view`
- 可编辑`e`或`e!`

### 文件名
1. `:f filename`重命名当前文件

### 目录切换

- 切换到其他目录`cd dir`
- 回到上一个工作目录`cd -`

# 快速浏览

## 窗口管理

### tab页

`Te`全称Texplore。

- `gt` 下一页
- `gT` 上一页
- `{i}gt` 到指定页
- `tabs`查看tab情况
- `tabclose [i]` 有数字，关闭指定页；无数据，关闭当前页
- `vim -p 1.cpp 2.cpp`vim的`-p`参数可以用tab的方式打开多个文件
- `bufdo tab split`把buffer中全部文件转成tab

### 分屏

#### 关闭分屏

- `Ctrl-w c`关闭当前窗口
- `Ctrl-w o`关闭其他分屏，只保留当前分屏
- `Ctrl-w q`关闭当前窗口，如果只剩最后一个，则退出

#### 移动分屏

`Ctrl-w
L/H/K/J`向右左上下移动分屏。如果我们想在水平分屏和垂直分屏间切换，可以使用这些指令。

#### 在分屏中移动光标

`Ctrl-w l/h/k/j`

#### 尺寸

- 所有屏幕一样的高度`Ctrl-w =`
- 增加高度`Ctrl-w +`
- 减少高度`Ctrl-w -`

#### 分割窗口

- `He` Hexplore上下分屏，下面进行目录浏览
- `He!` 上下分屏，上面进行目录浏览
- `Ve` Vexpore左右分屏，左边目录
- `Ve!` 左右分屏，右边目录

- 垂直分割窗口`Sex`
- 水平分割`vs`

## 折叠
1. zc:折叠，zC:递归折叠
2. zo:取消折叠，zO:递归取消
3. zM:折叠全文件
4. zR:取消全文件折叠

## severin-lemaignan/vim-minimap
自定义按键绑定：

```
let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>gc'
let g:minimap_toggle='<leader>gt'
```

# Leader键绑定
1. leader键为空格
2. w:保存文件

# 文本处理

## spell
|command|用途|
|:---|---:|
| `:set spell`  |启用拼写检查 |
| `:set nospell`  |关闭|
| `]s`  | 移动到下一个拼写错误  |
| `[s` | 移动到上一个 |
| `z=` | 选择正确拼写 |
| `zg`  | 添加用户拼写  |
| `zw`  | 删除用户拼写 |

# terminal

- `:terminal` `term`命令打开新的终端窗口。
- `:exit`退出终端，只关闭窗口时我们无法使用`:qa`退出vim。
- `vert term`横向切分出终端窗口，`tab term`新标签页打开终端窗口。
- 终端也有normal模式和insert模式。按`Ctrl-\ Ctrl-n`切换到normal模式，此时才能想vim的buffer一样移动光标，切换窗口。按`i`进入插入模式。

# git

## tpope/vim-fugitive

- `Gedit` View any blob, tree, commit, or tag in the repository with :Gedit (and :Gsplit, :Gvsplit, :Gtabedit, ...). Edit a file in the index and write to it to stage the changes.
- `:Gdiff` to bring up the staged version of the file side by side with the working tree version and use Vim's diff handling capabilities to stage a subset of the file's changes.
- `:Gstatus` Bring up an enhanced version of git status with :Gstatus. Press - to add/reset a file's changes, or = to expand an inline diff and operate on individual hunks.
- `:Gcommit %` to commit the current file, editing the commit message inside the currently running Vim.
- `:Gblame` brings up an interactive vertical split with git blame output. Press enter on a line to edit the commit where the line changed, or o to open it in a split. When you're done, use :Gedit in the historic buffer to go back to the work tree version.
- `:Glog` (不好用，用gv.vim替代) loads all previous revisions of a file into the quickfix list so you can iterate over them and watch the file evolve!

## junegunn/gv.vim

### Commands

- `:GV` to open commit browser
    - You can pass `git log` options to the command, e.g. `:GV -S foobar`.
- `:GV!` will only list commits that affected the current file
- `:GV?` fills the location list with the revisions of the current file

`:GV` or `:GV?` can be used in visual mode to track the changes in the
selected lines.

### Mappings

- `o` or `<cr>` on a commit to display the content of it
- `o` or `<cr>` on commits to display the diff in the range
- `O` opens a new tab instead
- `gb` for `:Gbrowse`
- `]]` and `[[` to move between commits
- `.` to start command-line with `:Git [CURSOR] SHA` à la fugitive
- `q` to close


# 其他
1. vim和shell切换：Ctrl-z vim后台运行，跳转到shell，在shell输入fg，切回vim
2. junegunn/goyo.vim 沉浸模式

# 外部插件依赖

1. ag
1. fzf

## 修改

- 2019/3/19之前，初步整理
- 2019/3/19，更新补全的操作，tab操作，buffer的操作。删除冗余的vim前言，去掉啰嗦带鼓吹性质的语言
- 2019/3/22，新增git相关插件，git操作是高频操作，避免频繁切到终端
- 2019/4/3，删除ctrlp，新增fzf
