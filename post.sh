#!/bin/bash

#error checks
if [ !  $# -eq 3 ]; then
        echo 'Must have 3 names' >&2; exit 1
elif [ ! -e "$1" ]; then
        echo "$1 does not exist" >&2; exit 1
elif [ ! -e "$2" ]; then
        echo "$2 does not exist" >&2; exit 1
else
#cs protection
./p.sh "$1"
# goes to user directory
cd "$1"
        if [ ! -e "$2"  ]; then

	#if they are not friends, return to home folder to remove lock and throw exit code
	cd ..
        echo "$1 is not a friend of $2" >&2; exit 1


        else
	# post message from user 1 to user 2
        echo "$2: $3" >> wall
	echo "message has been posted"
	cd ..
        fi
fi
# removes lock
./v.sh "$1"

exit 0 
