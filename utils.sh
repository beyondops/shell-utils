#!/bin/bash
# Common utils for bash

#########################################################
# Log common utils
# example:
#   log::info "your info message"
#   log::warn "your warning message"
#   log::error "your error message"
#   log::debug "your debug message"
#   log::success "your success message"
#########################################################

readonly _LOG_OPT="$0 $*"

_OUTPUT_TYPE=0
if [[ -t 1 ]]; then
    _OUTPUT_TYPE=1
fi
readonly _OUTPUT_TYPE

# white on blue
function log::info() {
    if [[ $_OUTPUT_TYPE -eq 0 ]]; then
        printf '%s [INFO] %s\n' "$(date +'%Y-%m-%dT%H:%M:%S%z')" "$*"
    else
        printf '\033[44;37m%s [INFO] %s\033[0m\n' "$(date +'%Y-%m-%dT%H:%M:%S%z')" "$*"
    fi
}

# black on yellow
function log::warn() {
    if [[ $_OUTPUT_TYPE -eq 0 ]]; then
        printf '%s [WARN] %s\n' "$(date +'%Y-%m-%dT%H:%M:%S%z')" "$*"
    else
        printf '\033[43;30m%s [WARN] %s\033[0m\n' "$(date +'%Y-%m-%dT%H:%M:%S%z')" "$*"
    fi
}

# yellow on red
function log::error() {
    if [[ $_OUTPUT_TYPE -eq 0 ]]; then
        printf '%s [ERROR] %s\n' "$(date +'%Y-%m-%dT%H:%M:%S%z')" "$*"
    else
        printf '\033[41;33m%s [ERROR] %s\033[0m\n' "$(date +'%Y-%m-%dT%H:%M:%S%z')" "$*"
    fi
}

# black on green
function log::success() {
    if [[ $_OUTPUT_TYPE -eq 0 ]]; then
        printf '%s [SUCCESS] %s\n' "$(date +'%Y-%m-%dT%H:%M:%S%z')" "$*"
    else
        printf '\033[42;30m%s [SUCCESS] %s\033[0m\n' "$(date +'%Y-%m-%dT%H:%M:%S%z')" "$*"
    fi
}

# black on gray
readonly _DEBUG=${DEBUG-0}
function log::debug() {
    if [[ $_DEBUG -eq 0 ]]; then
        return
    fi
    if [[ $_OUTPUT_TYPE -eq 0 ]]; then
        printf '%s [DEBUG] %s\n' "$(date +'%Y-%m-%dT%H:%M:%S%z')" "$*"
    else
        printf '\033[47;30m%s [DEBUG] %s\033[0m\n' "$(date +'%Y-%m-%dT%H:%M:%S%z')" "$*"
    fi
}

#########################################################
# Time common utils
# example:
#   time::start "Start app"
#   time::step_time "Finish step"
#########################################################


_START_TIME=0
_PRE_TIME=0

# Init start time, print start information
time::start() {
    _START_TIME=$(date +%s)
    _PRE_TIME=$_START_TIME
    log::info "[TIME] [start] $*"
}

# Caculate the interval, print the interval information
time::_print_interval() {
    local interval_day=$(($1/24/3600))
    local interval_hour=$(($1%(24*3600)/3600))
    local interval_minute=$(($1%3600/60))
    local interval_second=$(($1%60))
    echo -n "${interval_day}d-${interval_hour}h-${interval_minute}m-${interval_second}s"
}

# Print step interval time
time::step_time() {
    local time_current
    time_current=$(date +%s)
    log::info "[TIME] [step: $(time::_print_interval $((time_current-_PRE_TIME))), total: $(time::_print_interval $((time_current-_START_TIME)))] $*"
    _PRE_TIME=$time_current
}
