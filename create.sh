#!/bin/bash

#checks to see if user exists
if [ !  $# -eq 1 ]; then
        echo 'Error, Only 1 name allowed' >&2; exit 1
elif [ -e "$1" ]; then
        echo "Error, User already exists" >&2; exit 1

else
	#locks file to protect cs
	./p.sh "$1"
	#creates user useing arg 1 as the name
        mkdir "$1"
	echo "User Created"
	#returns to home folder
	cd "$1"
	touch wall
	cd ..
fi
# romoves lock
./v.sh "$1"

exit 0
