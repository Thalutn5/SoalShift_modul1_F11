#!/bin/bash

read output
array=abcdefghijklmnopqrstuvwxyz
array2=ABCDEFGHIJKLMNOPQRSTUVWXYZ
jam=${output:0:2} ##jam dari index nol sampe index kedua 
# echo ${array[@]}
array3=($(echo ${array2[@]})$(echo ${array[@]}))
array4=($(echo ${array[@]})$(echo ${array[@]}))
array5=($(echo ${array2[@]})$(echo ${array2[@]}))
#echo ${array3[@]}
rotate=$jam
#echo $rotate
trans=$(echo $array | tr "${array:0:26}" "${array4:${rotate}:26}")
trans2=$(echo $array2 | tr "${array2:0:26}" "${array5:${rotate}:26}")
trans3=($(echo ${trans2[@]})$(echo ${trans[@]}))
#echo ${trans3[@]}
#echo $hasil
< "$output" > "$output dec" tr "${trans3}" "${array3}" 

