# VimStript

## 变量
- let 初始化或赋值
- unlet 删除变量
- unlet! 删除变量，且会忽略变量不存在的错误提示

与JavaScript类似，变量在函数之外初始化，是全局变量；反之，局部变量。可以在变量名称之前加冒号前缀，明确指明变量的作用域：

```` VimScript
g:var 全局
a:var 函数参数
l:var 函数局部变量
b:var buffer局部变量
w:var window局部变量
t:var tab局部变量
s:var 当前脚步内可见的局部变量
v:var Vim预定义的内部变量
````

## 类型

### Number Float String

### Funcref函数引用

函数引用必须以大写字符开头。`let Myfunc = function("strlen")`

### List有序列表(数组)

```` vimscript
let list = [1, 2, [3, 4]]
list[0]
````


### Dictionary无序的key/value容器

```` vimscript
let dict = {'blue': "#0000ff", 'foo': {999: "baz"}}`
````

### 字符串

设置了ignorecase会影响==和!=的比较结果，可以在添加`?`或`#`来明确指定大小写是否忽略。

- `<string>.<stript>`：字符串连接
- `<string> == <string>`: 字符串相等
- `<string> != <string>`: 字符串不等
- `<string> =~ <pattern>`: 匹配 pattern
- `<string> !~ <pattern>`: 不匹配 pattern
- `<operator>#`: 匹配大小写
- `<operator>?`: 不匹配大小写

### 流程控制：if for while try/catch

### 函数

function定义函数，`function!`覆盖函数定义，函数名必须以大写字母开头。函数和变量一样有作用域。
delfunction <function>删除函数，`call function`调用函数，call必须，除非在表达式中。
```` vimscript
function! g:FunctionName(arg1, arg2)
    <function body>
endfunction
````

### 面向对象

无原生支持，用字典模拟。dict内部可以使用self访问dict本身。对字典使用deepcopy()方法复制，实现实例化。

```` vimscript
let MockClass = {"foo": "Foo"};
function MockClass.printFoo() dict
    echo self.foo
endfunction

" 实例化

let instance = deepcopy(MyClass)
call instance.printFoo()
````

### 资料

[VimScript 五分钟入门（翻译）](https://zhuanlan.zhihu.com/p/37352209)

[usr_41](http://vimcdoc.sourceforge.net/doc/usr_41.html)

[VimL 语言编程指北](https://github.com/lymslive/vimllearn)

[Vim 脚本代码规范](https://github.com/wsdjeg/vim-script-style-guide)
