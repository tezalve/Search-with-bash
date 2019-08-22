#! /bin/bash

file=GUTINDEX.txt

echo "Welcome To $file"

i=0
while read -r p
do
    a[$i]=$p
    (( i++ ))
done < $file

m=0
while [ $m -eq 0 ]
do 
    NEWLINE=$'\n'
    echo "Search By?${NEWLINE}1.Etext No${NEWLINE}2.Book Name or Author Name"
    read -p "Option:" c

    case $c in
        1 ) i=0
            read -p "Enter Etext No : " n
            echo "Searching..." 
            while read -r p
            do
                var1=${p##* }
                l=${#var1}
                if [[ $var1 = *[![:space:]]* && "${var1:$l-2:1}" != "]" && ${var1:0:1} == ?(-)+([0-9]) && $n == $var1 ]]
                then
                    echo ${a[$i]} | awk '{$NF="";sub(/[ \t]+$/,"")}1'
                    echo ${a[$i+1]}
                    break
                fi
                (( i++ ))
            done < $file
            ;;

        2 ) read -p "Enter Book Name or Author Name: " n
            echo "Entered To Search : $n"
            echo "Searching..."
            sleep 2
            grep -A 1 -B 1 -i "$n" $file
            ;;
    
        * ) echo "Invalid Entry"
            ;;
    esac

    read -p "Exit?(0/1) " m 
done
$SHELL
