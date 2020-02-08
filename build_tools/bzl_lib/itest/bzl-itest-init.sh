#!/bin/bash -u

# This is the `bzl itest-run` bootstrap script. In general, we delegate actions that must be
# performed as root to this script which only executes inside the container.

# we do not want to exit on first failure here.
set +e

if [ -d $RUNFILES/../dbx_build_tools ]; then
  dbx_build_tools_root=$RUNFILES/../dbx_build_tools
else
  dbx_build_tools_root=$RUNFILES/external/dbx_build_tools
fi

source $dbx_build_tools_root/build_tools/bzl_lib/itest/bzl-itest-common.sh

if [ -d "$CLEANDIR" ]; then
  find $CLEANDIR -mindepth 1 -delete
fi

# older images do not have this necessary apt folder
mkdir -p /var/cache/apt/archives/partial

mkdir -p $(dirname $TEST_TMPDIR)
# Generate a symlink to the $TEST_TMPDIR for convenience right now.
ln -s $TEST_TMPDIR /tmp/bzl

mkdir -p $(dirname $SVCCTL_LOG)
# avoid a race where the service launcher hasn't created this file before tail gets to it
touch $SVCCTL_LOG

setsid $LAUNCH_CMD --svc.services-only >> $SVCCTL_LOG 2>&1 < /dev/null &
PID=$!

echo -n $PID > $PID_FILE_LOCATION
touch /etc/motd
echo "Service controller logs are at $SVCCTL_LOG" >> /etc/motd
echo "Individual service logs are at $TEST_TMPDIR/logs/service_logs/" >> /etc/motd
echo "Logs are stored on the host at $HOST_TEST_TMPDIR/logs/" >> /etc/motd
wait $PID
echo -n "$?" > $EXIT_CODE_FILE_LOCATION
sleep infinity
