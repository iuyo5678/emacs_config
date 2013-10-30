#
# This file was generated from Makefile.in on Thu Sep 26 18:58:46 CST 2013
#

DOXYGEN   = /home/users/zhangguhua/.emacs.d/lisps/doxygen-1.8.5
TMAKEPATH = /home/users/zhangguhua/.emacs.d/lisps/doxygen-1.8.5/tmake/lib/linux-g++
ENV       = env TMAKEPATH="$(TMAKEPATH)"
TMAKE     = /home/users/zhangguhua/.emacs.d/lisps/doxygen-1.8.5/tmake/bin/tmake
MAKE      = /usr/bin/gmake
PERL      = /usr/bin/perl
RM        = rm -f
CP        = cp
VERSION   = 1.8.5
INSTALL   = /usr/local
INSTTOOL  = /usr/bin/install
DOXYDOCS  = ..
DOCDIR    = $(INSTALL)/share/doc/packages/doxygen
QTDIR     = 
all: Makefile.libmd5 
	$(MAKE) -f Makefile.libmd5

clean: Makefile.libmd5 
	$(MAKE) -f Makefile.libmd5 clean

distclean: clean
	$(RM) -f Makefile.libmd5 libmd5.pro Makefile 

tmake:
	$(ENV) $(PERL) "$(TMAKE)" libmd5.pro >Makefile.libmd5

Makefile.libmd5: libmd5.pro
	$(ENV) $(PERL) "$(TMAKE)" libmd5.pro >Makefile.libmd5

install:
