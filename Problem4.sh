#!/bin/bash
#A script to examine which stock has the greatest amount of information
stock_names="XOM GOOG AAPL IBM JNJ HOG BAC JPM MSFT MMM SPY DIA"
count=0
echo "Counting starts here."
for stock in $stock_names
do 
    #Counting and printing inside the loop
    count=$(grep -c -w $stock S20130124_subset.txt)
    echo $stock" "$count >> ./HW1_Q4.txt
    echo $stock" "$count
done

#Print out the results on the screen and also into file 'HW1_Q4'
echo "The most active stock of the list is:"
sort -k2 HW1_Q4.txt | head -n 1 | cut -d' ' -f1
echo "The most active stock of the list is:">> ./HW1_Q4.txt
sort -k2 HW1_Q4.txt | head -n 1 | cut -d' ' -f1>> ./HW1_Q4.txt
