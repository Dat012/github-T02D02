#!/bin/bash

file=$1
search_string=$2
replace_string=$3

if [[ $search_string!="" && $replace_string!="" ]]; then
	sed -i '' "s/$search_string/$replace_string/g" $file
fi

dat=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M" $filename)
size=$(stat $filename | awk '{print $8}')
sum=$(openssl sha256 $filename | awk '{print $2}')

echo $filename '-' $size '-' $dat '-' $sum '-' sha256 >> files.log
