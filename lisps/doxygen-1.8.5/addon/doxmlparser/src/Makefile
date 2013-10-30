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
all clean depend: Makefile.doxmlparser 
	$(MAKE) -f Makefile.doxmlparser $@

distclean: clean
	$(RM) -rf Makefile.doxmlparser doxmlparser.pro Makefile obj

tmake:
	$(ENV) $(PERL) $(TMAKE) doxmlparser.pro >Makefile.doxmlparser

Makefile.doxmlparser: doxmlparser.pro
	$(ENV) $(PERL) $(TMAKE) doxmlparser.pro >Makefile.doxmlparser

install:
