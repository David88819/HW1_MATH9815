#!/bin/bash
## create the directory to save file
mkdir DJIA
cd DJIA

## list of DJIA Member
Ticker="AAPL AXP BA CAT CSCO CVX DD DIS GE GS HD IBM INTC JNJ JPM KO MCD MMM MRK MSFT NKE PFE PG TRV UNH UTX V VZ WMT XOM"

##download each ticker's data since 2015/08/03 to 2015/08/31
for member in $Ticker
do
    curl -o $member.csv "https://www.quandl.com/api/v3/datasets/YAHOO/$member.csv?start_date=2015-08-03&end_date=2015-08-31"
done

## extract the date from JPM.csv and put into date.csv
cat JPM.csv | sort | cut -d, -f1 | grep -E '^[0-9]' > date.csv
DATE="`cat date.csv`"

##create the directory
for date in $DATE
do
    mkdir $date
done

## create djia_member_values.csv in each date directories
for date in $DATE
do
    cd $date
    touch djia_member_values.csv
    echo "Stock,Open,High,Low,Close,Volume,Adjusted Close" > djia_member_values.csv
    cd ..
done

## get each date from the member.csv to save in the value.csv
for member in $Ticker
do
    for date in $DATE
    do
        grep -E "$date" $member.csv | awk -v var="$member" '$1=var' FS=, OFS=, >> ./$date/djia_member_values.csv
    done
done

## list all files
ls
for date in $DATE
do
    ls $date
done

## delete some files
for member in $Ticker
do
    rm $member.csv
done
rm date.csv
