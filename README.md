# Bash-Mini-Social-Media

The idea behind this project is to mimic a social media site and is slightly longer to explain than other code on my github so bare with me.  
The client.sh is used as a user interface of sorts that communicates with the server.sh file that is running in another terminal. So, the client feeds command line arguments to the server and the server will take those arguments as input and then run the requested scripts. 

Each script does the following: 
Create.sh - Creates a new user and a friend list and wall for that user
Add.sh - Takes two users and adds them to each other's friend list. 
Post.sh - This allows two friends to write messages to each others wall 
Show.sh - Displays what each user has written to each other's wall.  
P.sh & V.sh - These are semaphores to help with concurrency issues 

Once the server is running, it will create a server pipe and once the client is running, it creates a pipe that will be named by the user with their first argument. The client then checks the second argument to see if it matches any of the known requests that the server can take. If the second argument is a match for the known requests, the arguments will be then passed to the server pipe and read by the server. The server will take in these arguments from the pipe and will put them into an array called request. The requests can then be read from the server using the index of the array. 

The indexes are read as follows: 
Index[0] – client pipe id 
Index[1] – Command for the server to follow/run correct script 
Index[2] – Username – receiver (depending script) 
Index[3] – User name - sender 
Index[4] – Message 

The server will then read the index [1] to check which request it matches with and will run the requested program using the indexs 2, 3, and 4 as the necessary arguments for the programs. The server will continue to run until the shutdown command is entered.
