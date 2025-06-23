#!/bin/bash
echo "Hello! What's your name?"
read username
echo "It's nice to meet you, $username!"
read -p "How old are you? "
echo "Wow! $REPLY."
if read -t 10 -sp "Enter secret password " secret;then 
	echo -e "\nSecret password = '$secret'"
else
	echo -e "\nInput timed out"
fi
