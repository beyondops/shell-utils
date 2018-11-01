#!/bin/bash
set -eu

readonly DEBUG=1
source ./utils.sh

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