#!/bin/bash
#Help function
func_help () {
#display help
	echo "description"
	echo
	echo "syntax"
	echo "options:"
	echo "-h - option 1"
	echo "-v - option 2"
	echo
}
#Set variable
Name="world"
#Get the options
while getopts ":hn:" option;
do
	case $option in
		h) func_help; exit;;
		n) Name=$OPTARG;;
		*) echo "invalid option"; exit;;
	esac
done

echo "Hello $Name"
