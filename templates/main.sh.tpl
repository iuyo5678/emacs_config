#!/usr/bin/env bash

# Time-stamp: <2013-09-06 00:42:11 Friday by zhangguhua>

# @file (>>>FILE<<<)
# @version 1.0
# @author (>>>USER_NAME<<<)

readonly PROGRAM_NAME="(>>>FILE<<<)"
readonly PROGRAM_VERSION="1.0.0"

home=`cd $(dirname "$0") && pwd`

. "$home"/common.sh

usage()
{
    local code=1
    local redirect
    
    if [ $# -gt 0 ]; then
        code="$1"
    fi

    if [ "$code" != 0 ]; then
        redirect="1>&2"
    fi

    eval cat "$redirect" << EOF
usage: ${PROGRAM_NAME} [OPTIONS]

Options:
    -v  Output version info.
    -h  Output this help.
EOF

    exit "$code"
}

version()
{
    echoo "${PROGRAM_NAME} ${PROGRAM_VERSION}"
    exit
}

optInd=1

while getopts ":hv" OPT; do
    case "$OPT" in
        v)
            version
            ;;

        h)
            usage 0
            ;;

        :)
            case "${OPTARG}" in
                ?)
                    echoe "Option \`-${OPTARG}' need argument.\n"
                    usage
            esac
            ;;

        ?)
            echoe "Invalid option \`-${OPTARG}'.\n"
            usage
            ;;
    esac
done

shift $((optInd - 1))

(>>>POINT<<<)
