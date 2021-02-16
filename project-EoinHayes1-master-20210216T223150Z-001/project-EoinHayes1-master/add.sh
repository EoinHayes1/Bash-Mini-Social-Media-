#!/bin/bash

#checks args
if [ !  $# -eq 2 ]; then
        echo 'Must have 2 names' >&2; exit 1
elif [ ! -e "$1" ]; then
        echo "$1 does not exist" >&2; exit 1
elif [ ! -e "$2" ]; then
	echo "$2 does not exist" >&2; exit 1
else

#protects critical section, more details in report
./p.sh "$1"

# go to the directory of arg1
cd "$1"
	#if user 2 exists, exit
	if [ -e "$2"  ]; then
	echo "$2 is already a friend of $1" >&2; exit 1

	else
	#creates friend
        touch "$2"
	echo "Friend has been added"
	#goes back to main folder to remove the lock
	cd ..
	fi
fi
#removes lock
./v.sh "$1"

exit 0

