#!/bin/bash

array=abcdefghijklmnopqrstuvwxyz
array2=ABCDEFGHIJKLMNOPQRSTUVWXYZ
# echo ${array[@]}
array3=($(echo ${array2[@]})$(echo ${array[@]}))
array4=($(echo ${array[@]})$(echo ${array[@]}))
array5=($(echo ${array2[@]})$(echo ${array2[@]}))
#echo ${array3[@]}
rotate=`date +"%H"`
#echo $rotate
trans=$(echo $array | tr "${array:0:26}" "${array4:${rotate}:26}")
trans2=$(echo $array2 | tr "${array2:0:26}" "${array5:${rotate}:26}")
trans3=($(echo ${trans2[@]})$(echo ${trans[@]}))
#echo ${trans3[@]}

hasil=`date +"%H:%M %d-%m-%Y"`
#echo $hasil
< /var/log/syslog > "$hasil" tr "${array3}" "${trans3}" 

