#!/usr/bin/env bash

# Time-stamp: <2013-09-06 00:43:38 Friday by zhangguhua>

set -x
aclocal                                         \
&& autoconf                                     \
&& libtoolize --copy --force --automake         \
&& automake --foreign --add-missing
