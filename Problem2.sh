#!/bin/bash
#Call this script to extract all the messages for the stock given by users

echo "Please input the symbol:"
read symbol

for name in $symbol
do
##create directory and create txt file and input the message
    mkdir $name
    cd $name
    touch ${name}_20130124.txt
    cd ..
    grep -E $name S20130124_subset.txt > ./$name/${name}_20130124.txt
done

