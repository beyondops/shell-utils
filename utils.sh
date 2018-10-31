#!/bin/bash
# Common utils for bash

readonly _LOG_OPT="$0 $*"

_OUTPUT_TYPE=0
if [[ -t 1 ]]; then
    _OUTPUT_TYPE=1
fi
readonly _OUTPUT_TYPE

# white on blue
function info() {
    if [[ $_OUTPUT_TYPE -eq 0 ]]; then
        printf '%s [INFO] %s\n' "$(date +'%Y-%m-%dT%H:%M:%S%z')" "$*"
    else
        printf '\033[44;37m%s [INFO] %s\033[0m\n' "$(date +'%Y-%m-%dT%H:%M:%S%z')" "$*"
    fi
}

# black on yellow
function warn() {
    if [[ $_OUTPUT_TYPE -eq 0 ]]; then
        printf '%s [WARN] %s\n' "$(date +'%Y-%m-%dT%H:%M:%S%z')" "$*"
    else
        printf '\033[43;30m%s [WARN] %s\033[0m\n' "$(date +'%Y-%m-%dT%H:%M:%S%z')" "$*"
    fi
}

# yellow on red
function error() {
    if [[ $_OUTPUT_TYPE -eq 0 ]]; then
        printf '%s [ERROR] %s\n' "$(date +'%Y-%m-%dT%H:%M:%S%z')" "$*"
    else
        printf '\033[41;33m%s [ERROR] %s\033[0m\n' "$(date +'%Y-%m-%dT%H:%M:%S%z')" "$*"
    fi
}

# black on green
function success() {
    if [[ $_OUTPUT_TYPE -eq 0 ]]; then
        printf '%s [SUCCESS] %s\n' "$(date +'%Y-%m-%dT%H:%M:%S%z')" "$*"
    else
        printf '\033[42;30m%s [SUCCESS] %s\033[0m\n' "$(date +'%Y-%m-%dT%H:%M:%S%z')" "$*"
    fi
}

# black on gray
readonly _DEBUG=${DEBUG-0}
function debug() {
    if [[ $_DEBUG -eq 0 ]]; then
        return
    fi
    if [[ $_OUTPUT_TYPE -eq 0 ]]; then
        printf '%s [DEBUG] %s\n' "$(date +'%Y-%m-%dT%H:%M:%S%z')" "$*"
    else
        printf '\033[47;30m%s [DEBUG] %s\033[0m\n' "$(date +'%Y-%m-%dT%H:%M:%S%z')" "$*"
    fi
}
