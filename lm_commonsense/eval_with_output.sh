#!/bin/bash

read -p 'PID of Process: ' model_pid

echo "Monitoring Started!"
echo "Starting Resource Monitoring for Running Models:\n\n" > outputs/eval_resources.txt

while kill -0 $model_pid 2>/dev/null; do
	top -b -n 1 | grep "$model_pid" >> outputs/eval_resources.txt
	echo "Resource Statitics Added..."
	sleep 5	
done

echo "\n\nCompleted Resource Monitoring\n" >> outputs/eval_resources.txt
echo "Monitoring Complete!"

