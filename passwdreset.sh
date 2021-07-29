#!/bin/bash
#-------------------------------------------------------------
# Script Description
# This Script is for changing/resetting user password
# Author  : Ibrahim Patel
# Date    : 17 Sept 2020
# Version : 1.0
#-------------------------------------------------------------

FILE=$HOME/serverlist.txt

Server=""
User=""
OldPasswd=""
NewPasswd=""

while read line
do
  #if value of $line starts with #, ignore it

    if [[ ${line:0:1} != '#' ]]
    then
    Server=$(echo $line | cut -d'|' -f1)
    User=$(echo $line | cut -d'|' -f2)
    OldPasswd=$(echo $line | cut -d'|' -f3)
    NewPasswd=$(echo $line | cut -d'|' -f4)

    echo "========================================================="
    echo "Changing Password for User $User in Server $Server"
    echo "========================================================="

    sshpass -p $OldPasswd ssh -n $User@$Server "(echo $OldPasswd; echo $NewPasswd; echo $NewPasswd) | passwd"
    fi
done < $FILE
