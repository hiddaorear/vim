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
5. gf: 打开光标所在的文件名对应的文件
6. Ctrl-Wf: 在新的分割窗口打开光标下文件
7. := 文件的总行数

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

## 根据搜索定位

### easymotion/vim-easymotion
自定义按键绑定: prefix为f，ff为easymotion-s2，根据两个字符搜索定位，大部分场景下能快速定位

# 快速编辑

## ervandew/supertab(tab键补全)


# Leader键绑定
1. leader键为空格
2. w:保存文件

# 其他
1. vim和shell切换：Ctrl-z vim后台运行，跳转到shell，在shell输入fg，切回vim

# 插件依赖
1. ag
