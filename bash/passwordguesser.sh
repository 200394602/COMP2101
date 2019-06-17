#!/bin/bash
# This script demonstrates testing to see if 2 strings are the same

myString="TestString"
referenceString="password"

[ $myString = $referenceString ] && echo "You guessed the password!" || echo "The password eludes you..."

# TASK 1: Improve it by asking the user for a password guess instead of using inline literal data

prompt="Guess the password : "
read -p "$prompt" myString

referenceString="notadoctor"
[ $myString = $referenceString ] && echo "You guessed the password!" || echo "The password eludes you..."

# TASK 2: Improve it by rewriting it to use the if command

prompt="Guess the password : "
read -p "$prompt" myString

referenceString="yesdoctor"
if [ $myString = $referenceString ]
then
  echo "You guessed the password!"
else
  echo "The password eludes you..."
fi

# TASK 3: Improve it by giving them 3 tries to get it right before failing (test 3 times but only if necessary)
#           *** Do not use the exit command

echo ""
echo "Guessing Game! You have three tries to guess the password!"
echo ""

  referenceString="newpassword"
  guess=3

  for ((i=1; i<=$guess; i++)) ;
  do
    prompt="Guess the password : "
    read -p "$prompt" myString
    if [ $myString = $referenceString ]
    then
      echo "You guessed the password!!"
      break
    else
      echo "The password eludes you..."
    fi
    if [ $i -ge $guess ] ; then
      echo "Sorry, you failed.. and the password still eludes you..."
      break
    fi
  done
