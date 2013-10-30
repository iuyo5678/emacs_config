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
#
# 
#
# Copyright (C) 1997-2013 by Dimitri van Heesch.
#
# Permission to use, copy, modify, and distribute this software and its
# documentation under the terms of the GNU General Public License is hereby 
# granted. No representations are made about the suitability of this software 
# for any purpose. It is provided "as is" without express or implied warranty.
# See the GNU General Public License for more details.
#
# Documents produced by Doxygen are derivative works derived from the
# input used in their production; they are not affected by this license.

all: language config.doc FORCE
	DOXYGEN_DOCDIR=$(DOXYDOCS); \
	export DOXYGEN_DOCDIR; \
        VERSION=$(VERSION) ; \
	export VERSION; \
	$(DOXYGEN)/bin/doxygen
	@rm -f ../latex/refman.tex
	@cp doxygen_logo*.gif ../html
	@cp Makefile.latex ../latex/Makefile
	@sed -e "s/\$$VERSION/$(VERSION)/g" doxygen_manual.tex >../latex/doxygen_manual.tex
	@sed -e "s/\$$VERSION/$(VERSION)/g" doxygen.sty >../latex/doxygen.sty 
	@epstopdf doxygen_logo.eps --outfile=../latex/doxygen_logo.pdf

clean: 
	rm -rf ../html ../latex *.bak 

language: language.doc 

language.doc: $(wildcard ../src/translator*.h) maintainers.txt language.tpl translator.py
	python translator.py

config.doc:  ../src/config.xml ../src/configgen.py
	python ../src/configgen.py -doc ../src/config.xml > config.doc

FORCE:
