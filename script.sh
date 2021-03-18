#!/bin/bash

export AFL_EXIT_WHEN_DONE=1
export AFL_NO_UI=1

[[ -z ${PLUGIN_EXEC_TIME} ]] && EXEC_TIME="" || EXEC_TIME="-V $PLUGIN_EXEC_TIME"
[[ -z ${PLUGIN_NAME} ]] && RUNNER_NAME="" || RUNNER_NAME="-M $PLUGIN_NAME"

afl-fuzz -i $PLUGIN_INPUT -o $PLUGIN_OUTPUT $EXEC_TIME $RUNNER_NAME -- $PLUGIN_EXEC $PLUGIN_PARAMS

export IN_MIN_DIR="$PLUGIN_OUTPUT/$RUNNER_NAME/queue"
export OUT_MIN_DIR="$PLUGIN_OUTPUT/$RUNNER_NAME/queue.min"

echo $IN_MIN_DIR
echo $OUT_MIN_DIR

afl-cmin -i $IN_MIN_DIR -o $OUT_MIN_DIR -- $PLUGIN_EXEC $PLUGIN_PARAMS

ls -la $IN_MIN_DIR
ls -la $OUT_MIN_DIR
rm -rf $IN_MIN_DIR
mv $OUT_MIN_DIR $IN_MIN_DIR

$PLUGIN_TEARDOWN