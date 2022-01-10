#!/bin/bash

for UTIL in $(cat /proc/stat |grep cpu |head -1|awk '{print ($5*100)/($2+$3+$4+$5+$6+$7+$8+$9+$10)}'|awk '{print 100-$1}'|awk -F "." '{print $1}')
do
	if [ $UTIL -ge 1 ]
	then
		echo "Critical"
	fi
done
