#!/bin/sh

export AFL_EXIT_WHEN_DONE=1
export AFL_NO_UI=1
if [ "$PLUGIN_EXEC_TIME" != "" ]; then
    PLUGIN_EXEC_TIME = "-V $PLUGIN_EXEC_TIME"
fi
$PLUGIN_AFL_ENV afl-fuzz -i $PLUGIN_INPUT -o $PLUGIN_OUTPUT $PLUGIN_EXEC_TIME -- $PLUGIN_EXEC $PLUGIN_PARAMS
$PLUGIN_TEARDOWN