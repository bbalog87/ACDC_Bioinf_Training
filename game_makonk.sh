#!/bin/bash
#Planning the script
# Find a numeric value for the number of files in the working  directory
#Let the user make input
#Compare the input to the numeric file number

filenumber=$(ls | wc -l)
read -p "Guess the number of scripts in this directory: " input
while [[ $filenumber!=$input ]]; do	
 if [ $input -gt $filenumber ]; then
    echo "Your guess is too big"
 elif [ $input -lt $filenumber ]; then
    echo "Your guess is too small"
 elif [ $input==$filenumber ]; then
    echo "Congratulations, You've won the game!"
      break
 else
   echo "Enter numeric input"
 fi
 read -p "Guess again: " input
done

