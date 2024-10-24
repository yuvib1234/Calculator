#!/bin/bash

while true; do
    echo "Welcome to the Calculator!"
    
    # Reading The Problem
    echo "Enter Two numbers:"
    read a
    read b 
    
    # Method of Math operations
    echo "Choose an operation:"
    echo "1. Addition"
    echo "2. Subtraction"
    echo "3. Multiplication"
    echo "4. Division"
    echo "5. Exit"
    read ch

    case $ch in
        1) res=$(echo "$a + $b" | bc);;
        2) res=$(echo "$a - $b" | bc);;
        3) res=$(echo "$a * $b" | bc);;
        4) res=$(echo "scale=2; $a / $b" | bc);;
        5) echo "Exiting..."; exit 0;;
        *) echo "Invalid option, please try again.";;
    esac

    if [[ -n $res ]]; then
        echo "Result: $res"
    fi

    echo ""
done
