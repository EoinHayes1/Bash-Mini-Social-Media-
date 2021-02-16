#!/bin/bash

if [ -z "$1" ]; then
	echo "usage: $0"
	exit 1

else
	while ! ln "$0" "$1-lock" 2>/dev/null; do
		sleep 1
	done
	exit 0
fi
