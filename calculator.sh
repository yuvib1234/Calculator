#!/bin/bash

abbreviate_number() {
    local num=$1
    local abs_num=$(echo "$num" | sed 's/-//')  
    if (( $(echo "$abs_num >= 1000000000" | bc) )); then
        echo "$(echo "scale=1; $num / 1000000000" | bc)B"
    elif (( $(echo "$abs_num >= 1000000" | bc) )); then
        echo "$(echo "scale=1; $num / 1000000" | bc)M"
    elif (( $(echo "$abs_num >= 1000" | bc) )); then
        echo "$(echo "scale=1; $num / 1000" | bc)K"
    else
        echo "$num"
    fi
}

while true; do
    echo "Welcome to the Calculator!"
    
    echo "Enter Two numbers:"
    read a
    read b 
    
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
        formatted_res=$(printf "%'.f\n" "$res" 2>/dev/null || echo "$res")
        abbreviated_res=$(abbreviate_number "$res")
        echo "Result: $formatted_res ($abbreviated_res)"
    fi

    echo " "
done
