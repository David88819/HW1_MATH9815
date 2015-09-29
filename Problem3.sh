#!/bin/bash
#A script to extract the sell orders from the file given
#Extract all the sell orders
grep -w -E 'A.*S|F.*S' S20130124_subset.txt > ./Sell_orders_20130124.txt

#Count the numbers of the sell orders for each symbol
stock_names="XOM GOOG AAPL IBM JNJ HOG BAC JPM MSFT MMM SPY DIA"
echo "Counting starts here."
for stock in $stock_names
do 
    #Counting and printing
    echo "The number of sell orders of "$stock" is: " >> ./HW1_Q3.txt
    grep -c -w $stock ~/Documents/Sell_orders_20130124.txt >> ./HW1_Q3.txt
done
echo "Counting is finished."


