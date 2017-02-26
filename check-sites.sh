#!/bin/bash

usersites="mysites.txt"
listURL="https://raw.githubusercontent.com/pirate/sites-using-cloudflare/master/sorted_unique_cf.txt"
listFile="./sorted_unique_cf.txt"
outFile="./compromised_sites.txt"

rm $outFile
touch $outFile
Echo "Compromised Sites:" >> $outFile

echo "Downloading most recent list..."

wget $listURL # Download the most current version of the list.

echo "Done.  Beginning check..."

for website in `cat $usersites`;
do
  if [ $(grep -xc $website $listFile) -eq 1 ]; 
  then
    echo "Match found: $website"
    echo $website >> $outFile;
  fi
done

echo "Done.  Your compromised sites are:"
cat $outFile
echo "This data is also listed in $outFile."
echo "Cleaning up..."
rm $listFile
read -rsp $'Press any key to exit...\n' -n1 key
