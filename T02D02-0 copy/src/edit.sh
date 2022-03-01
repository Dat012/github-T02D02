#!/bin/bash

filename=$1
search=$2
replace=$3

if [[ $search!="" && $replace!="" ]]; then
	sed -i '' "s/$search/$replace/" $filename
fi

dat=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M" $filename)
size=$(stat $filename | awk '{print $8}')
sum=$(openssl sha256 $filename | awk '{print $2}')

echo $filename '-' $size '-' $dat '-' $sum '-' sha256 >> files.log
