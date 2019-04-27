#/bin/bash

REMOTE=$1
USER=root
ssh ${USER}@${REMOTE} killall gdbserver> /dev/null
ssh ${USER}@${REMOTE} "gdbserver :9091 $2"