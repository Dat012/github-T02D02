#!bin/bash

if [ -f $1 ] && [ $1 != "" ]; then
	count_records=$(wc -l<$1)
    cut -f 1 -d " " $1 >> tmp1.txt
	count_uniq=$(sort tmp1.txt | uniq -du | wc -l)
	rm tmp1.txt

	cut -f 8 -d " " $1 >> tmp2.txt
	count_changes=$(sort tmp2.txt | uniq -du | wc -l)
	rm tmp2.txt

	echo $count_records $count_uniq $count_changes
fi
