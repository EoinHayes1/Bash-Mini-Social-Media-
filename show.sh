#!/bin/bash

#error check
if [ !  $# -eq 1 ]; then
        echo 'Error, Only 1 name allowed' >&2; exit 1
elif [ ! -e "$1" ]; then
        echo "Error, user does not exist" >&2; exit 1
else
#cs prection
./p.sh "$1"
# go to user
cd "$1"
        echo "Wall start"
  	# display wall
	cat wall
	echo "wall end"
	cd ..
fi

#remove lock
./v.sh "$1"

exit 0
