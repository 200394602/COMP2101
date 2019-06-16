#!/bin/bash
#
# this script rolls a pair of six-sided dice and displays both the rolls and the sum
#

# Improve this script by re-organizing it to:
#  put the number of sides in a variable which is used as the range for the random number
#  put the bias, or offset, for the RANDOM number in a variable (it is 1 for our purposes)
#     - you can think of this as the minimum value for the generated number
#  roll the dice using the variables for the range and bias i.e. RANDOM % range + bias
#  generate the sum of the dice
#  generate the average of the dice
#  display a summary of what was rolled, and what the result was

# Variable
sides=6
offset=1

# Tell the user we have started processing

echo "Rolling a pair of dice with $sides sides each
"

# roll the dice and save the results
die1=$(( RANDOM % $sides + $offset))
die2=$(( RANDOM % $sides + $offset ))

# Sum up the rolls
sum=$(( die1 + die2 ))

# Average of the rolls
avg=$(( sum/2 ))

# display the results as a summary
echo "Summary:

Rolled a pair of $sides sided dice.
Got $die1 and $die2 for a sum of $sum and an average of $avg."
