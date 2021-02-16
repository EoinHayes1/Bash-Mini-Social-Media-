#!/bin/bash

# deletes servere pipe if there is a crash and it is left running
if [ -e serverpipe ] ; then
        rm serverpipe
fi

#creates pipe for server
mkfifo serverpipe

while true; do
	# reads input and puts it into an array
        read -a request < serverpipe
	# if index 1 matchs run corrisponding program
        case "${request[1]}" in
        create)
		# runs program, takes arg required, outputs to client id pipe
                ./create.sh "${request[2]}" &> "${request[0]}"
                ;;
        add)
                ./add.sh "${request[2]}" "${request[3]}" &> "${request[0]}"
                ;;
        post)
                ./post.sh "${request[2]}" "${request[3]}" " $(echo ${request[@]:4})" &> "${request[0]}"
		;;
        show)
                ./show.sh "${request[2]}" &> "${request[0]}"
                ;;
        shutdown)
		# closes pipe on shutdown and sends message to pipe
                echo "Shutdown success" &> "${request[0]}"
                rm serverpipe
                exit 0
                ;;
        *)
		# error check incase the client fails to catch it
                echo "Error: bad request" &> "${request[0]}"
                exit 1
        esac
done

