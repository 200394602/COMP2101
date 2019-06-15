#!/bin/bash
#
# this script demonstrates doing arithmetic

# Improve this script by asking the user to supply the two numbers
# Improve this script by demonstrating using subtraction and multiplication
# Improve this script by demonstrating the modulus operation
#   - the output should look something like:
#   - first divided by second gives X with a remainder of Y
# Improve this script by calculating and displaying the first number raised to the power of the second number

#Asking user to enter two numbers
prompt="Enter two numbers : "
read -p "$prompt" firstnum secondnum

#ADDITION
sum=$((firstnum + secondnum))

#SUBTRACTION
sub=$((firstnum - secondnum))

#DIVISION
dividend=$((firstnum / secondnum))

#MODULUS
mod=$((firstnum % secondnum))

#PRECISE DIVISON
fpdividend=$(awk "BEGIN{printf \"%.2f\", $firstnum/$secondnum}")

#MULTIPLICATION
product=$((firstnum * secondnum))

#POWER
power=$((firstnum**secondnum))

#RESULTS

cat <<EOF

Results :

$firstnum plus $secondnum is $sum

$firstnum minus $secondnum is $sub

$firstnum multiplied by $secondnum is $product

$firstnum divided by $secondnum gives $dividend with a remainder of $mod
  - More precisely, the quotient is $fpdividend

$firstnum raised to the power of $secondnum is $power
EOF
