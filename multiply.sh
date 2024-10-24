if [ $# -ne 2 ]; then
    echo "Incorrect ussage. Use ./add.sh <number 1> <number 2>"
    exit 1
fi

a=$1
b=$2

res=$(echo "$a * $b" | bc)

if [[ -n $res ]]; then
        echo "Result: $res"
    else
        echo "You did not type in 2 valid numbers"
    fi
