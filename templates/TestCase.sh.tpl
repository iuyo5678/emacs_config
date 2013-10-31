#!/bin/sh

# Time-stamp: <2013-09-06 00:41:39 Friday by zhangguhua>

# @file (>>>FILE<<<)
# @version 1.0
# @author (>>>USER_NAME<<<)

shuStringEqualMsg()
{
    message="${1:-}"
    [ x"${2}" = x"${3}" ]
    shuAssert "$message" $?
}

shuStringEqualNoMsg()
{
    [ x"${1}" = x"${2}" ]
    shuAssert "" $?
}

Test(>>>POINT<<<)()
{
}

. "$SHUNIT_HOME/shUnit"
. "$SHUNIT_HOME/shUnitPlus"
shuStart
