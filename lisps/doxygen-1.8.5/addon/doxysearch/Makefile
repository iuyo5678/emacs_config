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

all clean depend: Makefile.doxysearch Makefile.doxyindexer
	$(MAKE) -f Makefile.doxysearch $@
	$(MAKE) -f Makefile.doxyindexer $@

distclean: clean
	$(RM) -rf Makefile doxysearch.pro Makefile.doxysearch
	$(RM) -rf Makefile doxyindexer.pro Makefile.doxyindexer

tmake:
	$(ENV) $(PERL) "$(TMAKE)" doxysearch.pro >Makefile.doxysearch
	$(ENV) $(PERL) "$(TMAKE)" doxyindexer.pro >Makefile.doxyindexer

strip:
	strip doxysearch

Makefile.doxysearch: doxysearch.pro
	$(ENV) $(PERL) "$(TMAKE)" doxysearch.pro >Makefile.doxysearch

Makefile.doxyindexer: doxyindexer.pro
	$(ENV) $(PERL) "$(TMAKE)" doxyindexer.pro >Makefile.doxyindexer

install:
	$(INSTTOOL) -d $(INSTALL)/bin	
	$(INSTTOOL) -m 755 ../../bin/doxysearch.cgi $(INSTALL)/bin	
	$(INSTTOOL) -m 755 ../../bin/doxyindexer $(INSTALL)/bin	
	$(INSTTOOL) -d $(INSTALL)/$(MAN1DIR)
	cat ../../doc/doxyindexer.1 | sed -e "s/DATE/$(DATE)/g" -e "s/VERSION/$(VERSION)/g" > doxyindexer.1
	$(INSTTOOL) -m 644 doxyindexer.1 $(INSTALL)/$(MAN1DIR)/doxyindexer.1
	rm doxyindexer.1
	cat ../../doc/doxysearch.1 | sed -e "s/DATE/$(DATE)/g" -e "s/VERSION/$(VERSION)/g" > doxysearch.1
	$(INSTTOOL) -m 644 doxysearch.1 $(INSTALL)/$(MAN1DIR)/doxysearch.1
	rm doxysearch.1

