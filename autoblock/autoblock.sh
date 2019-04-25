#!/bin/bash
# watch the access file and execute command

IFS=$'\n'

while true
do
	watch -g "tail -10 $1" &>/dev/null
	for item in $(tail -10 $1);
	do
		code=$(echo $item | sed -e 's/^\(.\{1\}\).*/\1/g')
		ipaddr=$(echo $item | awk '{print $1}')

		if [ "$ipaddr" != "::1" ] && [ "$code" != "2" ]; then
			tryCount=$(tail -40 $1 | grep $ipaddr | wc -l)

			# log blocked ip
			echo "[SUSPICIOUS] $ipaddr is suspicious" >> blockLog

			if [ "$ipaddr" != "::1" ] && [ "$tryCount" -gt 2 ]; then
				iptables -A INPUT -j DROP -s $ipaddr

				echo "[BLOCKED] $ipaddr is blocked" >> blockLog
			fi
		fi
	done
done

