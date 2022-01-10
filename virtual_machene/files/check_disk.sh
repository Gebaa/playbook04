#!/bin/bash

for UTIL in $(df -h | grep -Ev 'Filesystem|tmpfs'| awk -F " " '{print $5}' | sed 's/%//')
do
	if [ $UTIL -ge 80 ]
	then
		echo "Critical" >> /tmp/fs.txt
	fi
done

if [	$(cat /tmp/fs.txt | wc -l) -ge 1 ]
then
	echo "Critical"
fi

rm -rf /tmp/fs.txt
