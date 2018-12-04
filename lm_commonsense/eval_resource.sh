#!/bin/bash

read -p 'PID of Process: ' model_pid

printResourceUse="top -p$model_pid -b -n 1 | awk '{printf "%s %s %s %s %s %s %s\n",$1,$5,$6,$7,$9,$(10),$(11)}' >> outputs/eval_resources.txt"

echo "Monitoring Started!"

while kill -0 $model_pid 2>/dev/null; do
	eval $printResourceUse
	sleep 2
done

echo "Monitoring Complete!"

