#!/bin/bash

set -e


# Fetching clients details
clients=$2
bold=$(tput bold)  
STAGE=$1


IFS=','		# comma is set as delimiter


# Reading the split string into array
read -ra arr <<EOF
$clients
EOF

# Print each value of the array by using the loop
for val in "${arr[@]}";
do
    IFS=''
    line=$(grep "$val," clients.txt)
    clientName=$(echo $line |   cut -d ',' -f 1)
    clientsBundle=$(echo $line |  cut -d ',' -f 2 )
    clientBrandName=$(echo $line |  cut -d ',' -f 3 ) 
    echo $clientName $clientsBundle $clientBrandName
done
