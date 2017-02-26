#!/bin/bash

usersites="./mysites.txt"
listURL="https://raw.githubusercontent.com/pirate/sites-using-cloudflare/master/sorted_unique_cf.txt"
listFile="./sorted_unique_cf.txt"
outFile="./compromised_sites.txt"
constant=0

echo "" > $outFile;

echo "Downloading most recent list..."

#wget $listURL

echo "Done.  Beginning check..."

for site in `cat $usersites`; do
  echo "entering for loop"
  doesExist=`grep -xc $toCompare $listFile`
  if [ "$doesExist" > "$constant" ]; then
    echo $site >> $outFile;
	echo "Match."
  fi
done

echo "Done.  Your compromised sites are:"
cat $outFile
echo "This data is also listed in $outFile."
read -rsp $'Press any key to continue...\n' -n1 key
