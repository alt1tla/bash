#!/bin/bash
function_name () {
echo "1"
}
function function_name_name {
	echo "2"
}
function_name_name_name () { echo "3"; }
function function_name_name_name_name { echo "4";}
function_name
function_name_name
function_name_name_name
function_name_name_name_name
greeting () {
	echo "Hello $1"
}
greeting "Joe"
var1="A" 
var2="B"
func_zone () {
	local var1="C"
	var2="D"
	echo "Inside func var1:$var1, var2:$var2"
}
echo "Before func var1:$var1, var2:$var2"
func_zone
echo "After func var1:$var1, var2:$var2"
func_return () {
	echo "some res"
	return 44
}
func_return
echo $?
func_zone_2 () {
	func_res="some res"
}
func_zone_2
echo $func_res
func_zone_3 () {
	local func_result="some result"
	echo "$func_result"
}
func_result="$(func_zone_3)"
echo $func_result
