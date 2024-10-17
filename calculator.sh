#Welcome Message
echo "Welcome to the calculator!"
#Reading The Problem
echo "Enter Two numbers:"
read a
read b
#Method of Math operations
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Divison"
read ch

case $ch in
1)res=`echo $a + $b | bc`
;;
2)res=`echo $a - $b | bc`
;;
3)res=`echo $a \* $b | bc`
;;
4)res=`echo "scale=2; $a / $b" | bc`
;;
esac
echo "Result : $res"





