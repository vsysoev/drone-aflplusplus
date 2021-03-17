#!/bin/bash

export AFL_EXIT_WHEN_DONE=1
export AFL_NO_UI=1
if [ -z ${PLUGIN_EXEC_TIME+x} ]; then
    PLUGIN_EXEC_TIME="-V $PLUGIN_EXEC_TIME"
fi

if [ -z ${PLUGIN_NAME+x} ]; then
    PLUGIN_NAME="-M $PLUGIN_NAME"
fi
afl-fuzz -i $PLUGIN_INPUT -o $PLUGIN_OUTPUT $PLUGIN_EXEC_TIME $PLUGIN_NAME -- $PLUGIN_EXEC $PLUGIN_PARAMS
$PLUGIN_TEARDOWN