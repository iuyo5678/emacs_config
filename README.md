emacs_config
============

我的emacs配置，适合程序开发人员python，php等，基于DEA改进而来，我的emacs版本是24.5.1,要求emacs的版本是24.4以上，我没有在emacs 24.5之前的版本使用过。

dea的介绍主页在[这里](http://emacser.com/dea.htm)  感谢dea的作者配置文件中的大部分文件都是从dea的配置文件中copy过来，有些进行了一些
修改，目的是提供一个简单可用的配置文件。

配置会随时更新，我在使用中使用发现不合适的地方也会修正bug，如果你在使用种有任何问题，欢迎发邮件：iuyo5678@gmail.com,或者到[这个帖子](http://zghhome.com/?p=166)下面进行回复，看到会及时响应的。



使用的插件
============
auto-complete
jedi
magit
metaweblog
org2blog
php-mode
python-mode
slime
smex
yasnippet
color-theme
ace-auto-jump
switch-window
helm

required
============
由于使用了python的自动补全插件：jedi 需要提前安装python的包virtualenv，

安装
============
1: download the config file from the github
  git clone https://github.com/iuyo5678/emacs_config.git  ~/.emacs.d
2: open emacs and hope you enjoy it! :)

各个文件夹介绍
===========
init.el    配置文件的入口文件，编辑该文件的快捷键是C-x E可以快速打开该文件
mylisps/   该文件夹下存储着自己找的一些配置文件，后续会将里面的文件慢慢替代成elpa库中的文件，打开该文件夹的快捷键是C-x G m
elpa/      该文件夹是所有用elap安装的插件文件，为了方便开箱可用，所以完整的保存下来，打开该文件夹的快捷键是 C-x G l
templates/ 该文件夹是模板文件夹，里面存储了新建各种文件的个人模板配置。

使用前的准备工作
=============
使用前需要简单的配置一下你的个人信息，即可使用。个人信息配置在文件在lisps/personal-info.el中，需要配置你的邮箱和用户名，如果你有个人的wordpress博客，你也可以配置个人的博客的地址，否则可以不用管，或是注释掉。


FIX_LOG
============
2016-03-02
* 使用jedi完成python代码补全
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
像使用正常的emacs一样正常使用它，我会在这块地方不定时添加一些使用技巧，使用中去发掘吧....

### 字体大小
相关配置文件路径 mylisps/font-settings.el
