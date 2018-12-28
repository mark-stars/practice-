#!/bin/bash

TimeZone=`timedatectl | grep "Time zone" | awk '{ print $3 }' | awk -F/ '{ print $2 }'`

if [[ ${TimeZone} != Shanghai ]]; then
	timedatectl set-timezone Asia/Shanghai
	echo "TimeZone is OK!"
else
	echo "TimeZone is Shanghai"
fi

systemctl -l | grep crond > /dev/null 2>&1

if [[ $? -eq 0 ]]; then
	echo "0 0 * * * /sbin/poweroff" > /var/spool/cron/root
	echo "crond is OK!"
else
	echo "E: crond not running"
fi
