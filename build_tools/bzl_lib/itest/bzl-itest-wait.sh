#!/bin/bash -eu

# this script is used by `bzl itest-run` to wait for services to come up.

if [ -d $RUNFILES/../dbx_build_tools ]; then
  dbx_build_tools_root=$RUNFILES/../dbx_build_tools
else
  dbx_build_tools_root=$RUNFILES/external/dbx_build_tools
fi

source $dbx_build_tools_root/build_tools/bzl_lib/itest/bzl-itest-common.sh

# wait for pid file to exist
while [ ! -e $PID_FILE_LOCATION ]; do
  sleep 1
done

PID=$(cat $PID_FILE_LOCATION)
tail -f $SVCCTL_LOG --pid=$PID ---disable-inotify

# wait for exit code file to exist
while [ ! -e $EXIT_CODE_FILE_LOCATION ]; do
  sleep 1
done
EXIT=$(cat $EXIT_CODE_FILE_LOCATION)
exit $EXIT
