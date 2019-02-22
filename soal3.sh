#!/bin/bash

i=1
fileke=1

while [ $i -ne 0 ]
do
	if [[ -f /home/thalutn5/Documents/Soalshift1/nmr3/password$fileke.txt ]];
	##ngecek apakah ada file
	then
		fileke=$((fileke + 1))
	else
		cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1 > /home/thalutn5/Documents/Soalshift1/nmr3/password$fileke.txt
		##membuat sebuah string | persyaratan | panjangnya 12 | baris |di folder mana
		i=0
	fi
done
