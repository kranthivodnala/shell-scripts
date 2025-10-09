#!bin/bash
#File name as Argument
cat $1

#check file exists
if [ -f $1 ] # -f checks if the file exists
then
    echo "$1 file exists"
# If exist print the content of the file
    cat $1
else
    echo "$1 file does not exists"
fi