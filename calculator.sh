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

LOG_FILE="calculator_log.txt"

while true; do
    echo "Welcome to the Calculator!"
    echo "Choose an operation:"
    echo "1. Addition"
    echo "2. Subtraction"
    echo "3. Multiplication"
    echo "4. Division"
    echo "5. View Previous Answers"
    echo "6. Exit"
    read ch
    
    echo "Enter two numbers:"
    read a
    read b 

    case $ch in
        1) res=$(echo "$a + $b" | bc); operation="Addition";;
        2) res=$(echo "$a - $b" | bc); operation="Subtraction";;
        3) res=$(echo "$a * $b" | bc); operation="Multiplication";;
        4) res=$(echo "scale=2; $a / $b" | bc); operation="Division";;
        5)
            echo "Previous Answers:"
            if [[ -f "$LOG_FILE" ]]; then
                tail -n 10 "$LOG_FILE"
            else
                echo "No previous answers logged."
            fi
            continue
            ;;
        6) echo "Exiting..."; exit 0;;
        *) echo "Invalid option, please try again."; continue;;
    esac

    if [[ -n $res ]]; then
        formatted_res=$(printf "%'.f\n" "$res" 2>/dev/null || echo "$res")
        abbreviated_res=$(abbreviate_number "$res")
        echo "Result: $formatted_res ($abbreviated_res)"

        echo "$(date): $operation of $a and $b = $res ($abbreviated_res)" >> "$LOG_FILE"
    fi

    echo " "
done
