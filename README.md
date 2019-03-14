# 关于vim的思考
我用过vim、emacs，以及WebStorm和VS Code。我认为工具应当用其所长，用他的优点，有缺点用其他工具补充。我用vim，是因vim性能好，编辑快速。我的工作的电脑是一台MacBook Air，用IDE吃力，操作起来不流畅，卡顿起来非常难受。用vim做Web前端开发够用。Web前端很简单，我大概用没有安装额外的插件的vim工作了三年。ctrlp这些插件全没有安装，且在windows下使用，现在想来，未免觉得鲁莽可笑。以为用了高手的工具，就变成了高手，编程往层次高处去，这些都是次要的，解决的问题的思想更重要。当然，若工具影响了你的思考，那么工具也很重要。Ruby受emacs的影响，就是这样的。

这里插件和配置的取舍的原则是：性能优先，尽量简洁。要简洁，所以airline这样的插件，就不会选择。要性能，所以YouCompleteMe也被排除。同时格式化和lint之类的插件，个人体验了一下，不如IDE，这部分功能使用IDE的功能即可。同样，重构代码，以目前的配置，也不如WebStorm，涉及这部分功能就用WebStorm替代。

文本编辑非常重要的点：
1. 查看
2. 编辑

从大到小，找要编辑的文件，然后找到要编辑的文本字符。这是一个大处着眼，小处着手的过程。查找主要是搜索，文件或目录搜索。浏览主要是光标的移动。涉及到文件的操作，则依赖插件。而光标的移动，vim本身已经很强大了，以至于我用IDE都会安装vim的插件。当然光标移动也可使用搜索的方式，vim-easymotion就是这样的插件。

这里有一个非常好的思想，那就是编辑和找到编辑的文本，是两件事情，后者在编程中可能要远大于前者的时间。普通模式和插入模式很合理，也很好用。

而对于后者，编辑能力，vim不容易做到IDE的补全能力。在使用的过程，发现vim本身的补全功能其实也够用，多记忆了几个API而已。

当然，发现自己还有一颗初心，看到有人用vim，就想找对方要配置。看到新人，自己也忍不住推广一下vim。

# 搜索(思路：先大后小，先文件，后字符)

## 文件搜索

### ctrlp(路径以及文件名)

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

## 修改的历史中搜索

### undotree

自定义按键绑定: leader键为空格，undotree绑定在u(undo)上


# 光标定位

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

## ervandew/supertab(tab键补全)

## Instert模式
1. ctrl-d，ctrl-t 左右缩进
2. ctrl-w 删除
3. ctrl-u 重新编辑

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

### 关闭分屏

- 关闭当前窗口`Ctrl-w c`
- 关闭当前窗口，如果只剩最后一个，则退出`Ctrl-w q`

### 移动分屏

`Ctrl-w
L/H/K/J`向右左上下移动分屏。如果我们想在水平分屏和垂直分屏间切换，可以使用这些指令。

### 在分屏中移动光标

`Ctrl-w l/h/k/j`

### 尺寸

- 所有屏幕一样的高度`Ctrl-w =`
- 增加高度`Ctrl-w +`
- 减少高度`Ctrl-w -`

### 分割窗口

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
let g:minimap_toggle='<leader>gt'et g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>gc'
let g:minimap_toggle='<leader>gt'
```

# Leader键绑定
1. leader键为空格
2. w:保存文件

# 其他
1. vim和shell切换：Ctrl-z vim后台运行，跳转到shell，在shell输入fg，切回vim
2. junegunn/goyo.vim 沉浸模式

# 插件依赖
1. ag
