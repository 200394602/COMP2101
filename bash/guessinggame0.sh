#!/bin/bash
#
# This script implements a guessing game
# it will pick a secret number from 1 to 10
# it will then repeatedly ask the user to guess the number
#    until the user gets it right

# Give the user instructions for the game
cat <<EOF
Let's play a game.
I will pick a secret number from 1 to 10 and you have to guess it.
If you get it right, you get a virtual prize.
Here we go!

EOF

# Pick the secret number and set their default guess to be a wrong answer
secretnumber=$(($RANDOM % 10 +1)) # save our secret number to compare later
userguess=0

# This loop repeatedly asks the user to guess and tells them if they got the right answer

#while [ $userguess != $secretnumber ]; do # loop around until they get it right
#  read -p "Give me a number from 1 to 10: " userguess # ask for a guess
#  if [ $userguess -eq $secretnumber ]; then
#    echo "You got it! Have a milkdud."
#    exit
#  fi
#done

# TASK 1: Test the user input to make sure it is not blank

#while [ $userguess != $secretnumber ]; do # loop around until they get it right
#  read -p "Give me a number from 1 to 10: " userguess # ask for a guess
#  while [[ $userguess = "" ]]; do
#    read -p "Please enter a number : " userguess
#  done
#  if [ $userguess -eq $secretnumber ]; then
#    echo "You got it! Have a milkdud."
#    exit
#  fi
#done

#echo""

# TASK 2: Test the user input to make sure it is a number from 1 to 10 inclusive


#while :; do # loop around until they get it right
#  read -p "Give me a number from 1 to 10: " userguess # ask for a guess
#  [[ $userguess =~ ^[0-9]+$ ]] || { echo "Enter a number between 1 and 10"; continue; }
#  if ((userguess >= 1 && userguess <= 10)); then
#    echo "It is a valid number"
#    while [ $userguess != $secretnumber ]; do # loop around until they get it right
#    read -p "Give me a number from 1 to 10: " userguess # ask for a guess
#      if [ $userguess -eq $secretnumber ]; then
#          echo "You got it! Have a milkdud."
#          exit
#      fi
#    done
#  else
#    echo "The number is out of range, try again"
#  fi
#  if [ $userguess -eq $secretnumber ]; then
#    echo "You got it! Have a milkdud."
    #exit
#  fi
#done

#echo""
# TASK 3: Give them better feedback, telling them if their guess is too low, or too high

while [ $userguess != $secretnumber ]; do # loop around until they get it right
  read -p "Give me a number from 1 to 10: " userguess # ask for a guess
  if [ $userguess -eq $secretnumber ]; then
    echo "You got it! Have a milkdud."
    #exit
  fi
  if [ $userguess -gt $secretnumber ]; then
    echo "Your guess is too high!"
  elif [ $userguess -lt $secretnumber ]; then
    echo "Your guess is too low!"
  fi
done
