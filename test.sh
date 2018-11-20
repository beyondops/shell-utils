#!/bin/bash
set -eu
readonly SBIN="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly DEBUG=1
source "$SBIN/utils.sh"

log::info info
log::warn warn
log::error error
log::success success
log::debug debug

time::start "Start app"
sleep 1
time::step_time
sleep 1
time::step_time "Finish step"
