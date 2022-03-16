#!/bin/bash
# If conky is running, kill it.  Otherwise start it.

CONKY_PID=$(ps aux | grep "Run_Conky.sh" | awk '{print $2}')

if [ -z "$CONKY_PID" ]
then
    Run_Conky.sh &
else
    kill $CONKY_PID
fi
