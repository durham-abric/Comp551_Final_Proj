#!/bin/bash

read -p 'PID of Process: ' model_pid

printResourceUse="top -b -n 1 | grep "$model_pid" >> outputs/eval_resources.txt"

echo "Monitoring Started!"

while kill -0 $model_pid 2>/dev/null; do
	eval $printResourceUse
	sleep 2
done

echo "Monitoring Complete!"

