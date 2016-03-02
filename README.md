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
2: open emacs and hope you enjoy it! :)

FIX_LOG
============
2016-03-02
* 更改了配置文件的安装方式，直接clone下来，然后即可使用

-------------------------------------------------------------------------------

2015-04-03
* 修正了一些bug，在gui下使用鼠标会出现一个错误，升级了icomplete+，修正了一些小bug

-------------------------------------------------------------------------------
2015-03-31
* 改变了两个操作，主要是在c++模式下，C-c c 改为自动编译当前buffer代码， C-c r执行当前buffer代码
 编译命令 会根据文件名后缀自动编译命令，执行当前buffer代码，可执行文件为当前buffer文件名去掉后缀

-------------------------------------------------------------------------------
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
像使用正常的emacs一样正常使用它，我会在这块地方不定时添加一些使用技巧，现在你先去发掘吧....

