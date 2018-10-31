#!/bin/bash


readonly _LOG_OPT="$0 $*"

_OUTPUT_TYPE=0
if [ -t 1 ]
then
    _OUTPUT_TYPE=1
fi
readonly _OUTPUT_TYPE



