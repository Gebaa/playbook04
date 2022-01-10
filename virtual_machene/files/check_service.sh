#!/bin/bash

#get Input as a argiument

for service in "$@"
do
	echo "$service: `systemctl is-active $service`" >> /tmp/service_status
done

cat /tmp/service_status | grep inactive

#rm -rf /tmp/service_status
