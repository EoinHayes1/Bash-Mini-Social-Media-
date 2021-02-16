#!/bin/bash

# error checking
if [ ! $# -gt 1 ]; then
	echo "You need to enter at least 2 parameters" >&2 exit 1
elif [ $# -gt 5 ]; then
	echo "Too many parameters" >&2 exit 1
fi

if [ -e "$1" ] ; then
	echo "Client already exists" >&2 exit

#if error checks pass, proceed to next section

else
#creates pipe with the 1st arg provided
mkfifo $1

#if arg2 is matchs one of the request words, feed args to the serverpipe
if [[ "$2" = create ]] ; then
	echo "$1 $2 $3" &> serverpipe

elif [[ "$2" = add ]] ; then
        echo "$1 $2 $3 $4" &> serverpipe

elif [[ "$2" = post ]] ; then
        echo "$1 $2 $3 $4 $5" &> serverpipe

elif [[ "$2" = show ]] ; then
        echo "$1 $2 $3" &> serverpipe

elif [[ "$2" = shutdown ]] ; then
        echo "$1 $2" &> serverpipe
else
	#exits program and removes pipe if the is a bad request
	echo "Error with request"
	rm $1
	exit 1
fi


# read input from pipe id
while read input; do
	echo "$input"
done<"$1"

#removes client pipe when finished
rm $1

fi
