#!/bin/bash
#
# This script produces the dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

#Create an array variable named titles with at least six titles stored as elements
#(e.g. Professor, Operator, Programmer, Boss, Grunt, Final Boss).
#Create your own titles, do not just use the ones form the example or your classmates.

#Use the RANDOM variable to get a random number between 0 and the number of titles in your array,
#and save it in a variable named title_index

#Use the value in the title_index variable as an index into the titles array,
#and save the title stored there in the variable named title
#instead of having just one literal title in mytitle.


###############
# Variables   #
###############

titles=("Avenger" "Chicken Master" "Deathbringer" "Hunter" "The Chosen One" "Horseman" "PUBG Hero" "Final Boss" )
number=$(( ${#titles[@]} ))
random_num=$(( RANDOM % number ))
hostname=$(hostname)
time=$(date +%H:%M)
today=$(date +%A)
mytitle=${titles[$random_num]}

###############
# Main        #
###############


output="Welcome to planet $hostname, \"$mytitle $USER!\"
The time is $time on a wonderful $today !!"

cowsay -f dragon-and-cow $output | lolcat
