#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Time-stamp: <2013-09-06 00:43:00 Friday by zhangguhua>

# @version 1.0
# @author (>>>USER_NAME<<<)

import sys
import logging
import cgi
from flup.server.fcgi import WSGIServer
try:
    import json
except:
    import simplejson as json

logger = logging.getLogger()

def app(environ, start_response):
    params = cgi.FieldStorage(fp = environ["wsgi.input"], environ = environ, keep_blank_values = True)

    start_response('200 OK', [('Content-Type', 'text/plain')])
    (>>>POINT<<<)

if __name__ != "__main__":
    sys.exit(0)

WSGIServer(app).run()
