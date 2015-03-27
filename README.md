emacs_config
============

我的emacs配置，适合程序开发人员，c，c++，python，php等，基于DEA改进而来，我的emacs版本是24.3.1

dea的介绍主页在[这里](http://emacser.com/dea.htm)  感谢dea的作者配置文件中的大部分文件都是从dea的配置文件中copy过来，有些进行了一些
修改，目的是提供一个简单可用的配置文件。

配置在不定期修改，随着自己的使用发现不合适的地方。

INSTALL
============
1: download the config file from the github
  git clone https://github.com/iuyo5678/emacs_config.git  ~/.emacs.d
2: use the config file
  open the .emacs file in your home dir  and input "(load-file "~/.emacs.d/.emacs")"
3: open emacs and enjoy it! :)

FIX_LOG
============

2015-03-27
* 修正了python 的自动补全，现在python可以自动补全了.....撒花，
解决办法
下载pymacs  地址：https://github.com/pinard/Pymacs
解压 进入解压目录：
cd Downloads/Pymacs-master
安装：
sudo make install
拷贝文件：
cp pymacs.el  ~/.emacs.d/mylisps/

安装rope：
sudo pip install --upgrade rope
安装ropemode：
sudo pip install ropemode
安装ropemacs
sudo pip install ropemacs

安装pyflakes
sudo pip install pyflakes

配置文件参见 python-settings.el

参考：http://www.yilmazhuseyin.com/blog/dev/emacs-setup-python-development/


-------------------------------------------------------------------------------

2015-02-13
* 添加了一个功能打开文件的所在目录，快捷键为 C-x C-j


2015-02-06
* 在shell-mode下添加了一个快捷键，C-l 快速清屏，直接调用clear-shell实现
* 消除了一个dired-mode的一个小bug

-------------------------------------------------------------------------------

2015-01-20
* 精兵简政，开始删除一些无用的emacs的配置文件，提高性能，现在自己配置的emacs性能有点扛不住了，今晚删除掉了现在还没有用到的doxygen和doxymacs，后续有需要再添加。
* 另外将python-mode升级至6.20

-------------------------------------------------------------------------------

2015-01-20
* 修正了一个cn-weather的一个小bug，将最高气温和最低气温弄反了
* 添加了markdown.el在emacs里面可以写wiki文档了，具体使用可以参见[这里](http://wowubuntu.com/markdown/)

-------------------------------------------------------------------------------

2014-11-08
* 修正了cn_weather插件的错误，原始插件因为中国天气网站改版，解析会出错，已经将查询接口进行改变，由于预报天气需要申请，因此只保留了两个天气函数，一个是weather 出现当前的天气，另外一个是weather-now 查询当前的实时天气。另外原先cn-weather的功能并没有进行大的修改。目前还遗留bug初次查询会返回nil

-------------------------------------------------------------------------------

2014-01-12
* 1.0版  修正了原来使用autopair在python下会卡死的问题，目前使用electric-pair-mode来自动生成括号

How to use it
============
像使用正常的emacs一样正常使用它，我会在这块地方不定时添加一些使用技巧，

### dired 相关操作 ###

##### 打开dired #####
C-x d   选中一个目录，打开一个dired窗口

C-x C-j 打开当前文件所在的目录，会出现一个当前文件所在目录的dired窗口

##### 标记一个文件 #####
dired 最方便的一点就是可以对许多文件进行标记，并进行批量操作。标记的方 法有很多，最普通的标记就是 d 为当前文件贴上删除标签，之后可以使用 x 来 真正删除所有贴上删除标签的文件。
dired 还提供了许多预定义的方便的标记操作(当使用 C-u 传递一个前缀参数 时，他们执行相反操作，即去掉标记)，例如：

* # 为所有自动保存的文件(通常是文件名开始和结尾都是 # 的文件)贴上删除 标签。
* ~ 为所有备份文件(即文件名以 ~ 结尾的文件，Emacs 和 vi 等编辑器默认 情况下都会产生这样的文件)贴上删除标签。
* & 为“垃圾文件”(看 dired-garbage-files-regexp 的值可以知道 dired 把 哪些文件当作了垃圾文件)贴上删除标签。

通常这些命令可以方便地帮你清理垃圾，如果还不满意，可以使用 % d REGEXP <RET> 来输入自己的正则表达式，匹配到的文件会被贴上删除标签。

当然，能用的标签并不止是 D (即删除标签)，几乎任何一个字符都可以使用，不 过最常用的还是 * ， m 命令即是以 * 标记当前文件。同样，dired 提供了很多 方便的标记操作(这些命令在传递一个前缀参数的时候都会执行相反的操作，例如 C-u * * 会去掉所有可执行文件的标记)：

* * * 标记所有可执行文件。
* * @ 标记所有符号链接。
* * / 标记所有目录(不包括 . 和 .. )。
* * s 标记所有文件(不高考 . 和 .. )。
* * . 标记具有给定扩展名的文件。
* % m REGEXP <RET> 或 * % REGEXP <RET> 标记所有匹配到给定的正则表达式 的文件。
* % g REGEXP <RET> 标记所有文件 内容 匹配到给定的正则表达式的文件。
另外，还有一些相关的命令：

* u 去除当前行的标记。
* <DEL> 上移一行并去除该行的标记。
* U 去除所有标记。
* * ? MARKCHAR 或 M-<DEL> 去除所有以 MARKCHAR 标记的文件的标记，如果 传递一个前缀参数，则会对每一个文件要求你确认是否去除标记。
* t 交换标记，即所有原来标记为 * 的文件被置于未标记状态，原来未标记的 文件被标记为 * ，原来有其他标记的文件不受影响。

##### dired模式下的一些操作 #####
* + 创建目录
* w 复制文件名，如果通过 C-u 传递一个前缀参数 0 ，则复制决定路径名， 如果只是 C-u 则复制相对于 dired 当前目录的相对路径。
* I 把当前文件以 info 文档的格式打开。
* N 把当前文件以 man 格式打开(使用 WoMan)。
* Y 为所有标记的文件创建一个到指定目录的相对符号连接(即使用相对路径进 行引用，而不是绝对路径)。
* C 拷贝文件。把 dired-recursive-copies 设为非 nil 的值可以递归拷贝目 录，通常我们设定为 top ，这表示对于顶层目录 dired 会先进行询问是否 要递归拷贝，而其中的子目录则不再询问。如果嫌询问太麻烦，可以直接设 置为 always 。
* D 删除文件。类似的有一个 dired-recursive-deletes 变量可以控制递归删 除。
* R 重命名文件，也就是移动文件。
* H 创建硬链接。
* S 创建软链接。
* M 修改权限位，即 shell 里面的 chmod 命令。
* G 修改文件所属的组。
* O 修改文件的所有者。
* T 修改文件的修改时间，类似于 shell 命令 touch 。
* P 打印文件。
* Z 压缩或解压文件。
* L 把 Elisp 文件加载进 Emacs 。
* B 对 Elisp 文件进行 Byte compile 。
* A 对文件内容进行正则表达式搜索，搜索会在第一个匹配的地方停下，然后 可以使用 M-, 搜索下一个匹配。
* Q 对文件内容进行交互式的正则表达式替换。
* # 为所有自动保存的文件(通常是文件名开始和结尾都是 # 的文件)贴上删除 标签。
* ~ 为所有备份文件(即文件名以 ~ 结尾的文件，Emacs 和 vi 等编辑器默认 情况下都会产生这样的文件)贴上删除标签。
* & 为“垃圾文件”(看 dired-garbage-files-regexp 的值可以知道 dired 把 哪些文件当作了垃圾文件)贴上删除标签。


