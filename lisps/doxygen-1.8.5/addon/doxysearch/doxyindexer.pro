#
# This file was generated from doxyindexer.pro.in on Thu Sep 26 18:58:46 CST 2013
#

TEMPLATE     =	app.t
CONFIG       =	console warn_on static release
HEADERS      =	
SOURCES      =	doxyindexer.cpp
LIBS        += -L../../lib -lxapian -lqtools
DESTDIR      = 
OBJECTS_DIR  = ../../objects
TARGET       = ../../bin/doxyindexer
INCLUDEPATH += ../../qtools
DEPENDPATH  += 
TARGETDEPS   = 

    TMAKE_CXXFLAGS += -D_LARGEFILE_SOURCE
