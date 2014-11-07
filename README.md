Time-stamp: <2014-11-08 00:35:39 Saturday by nilin>

emacs_config
============

我的emacs配置，适合程序开发人员，c，c++，python，php等，基于DEA改进而来，我的emacs版本是24.3.1

dea的介绍主页在  http://emacser.com/dea.htm  感谢dea的作者配置文件中的大部分文件都是从dea的配置文件中copy过来，有些进行了一些
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
2014-11-08
修正了cn_weather插件的错误，原始插件因为中国天气网站改版，解析会出错，已经将查询接口进行改变，由于预报天气需要申请，因此只保留了两个天气函数，一个是weather 出现当前的天气，另外一个是weather-now 查询当前的实时天气。另外原先cn-weather的功能并没有进行大的修改。

1.0版  修正了原来使用autopair在python下会卡死的问题，目前使用electric-pair-mode来自动生成括号
