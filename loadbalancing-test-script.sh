#!/bin/bash

# Set variables
counter=1
FILE=test-results.txt
HEADING="-----WEIGHTED LOCALITY LOAD BALANCING TEST RESULTS-----"
URL="<istio-ingress-gateway-external-ip>/test"

# Check if test-results file exists. If so, delete content.
if test -f "$FILE"; then
    echo "$FILE exists."
    > $FILE
    cat $FILE
fi

# Add heading
echo $HEADING > $FILE

# Query the endpoint 10x
until [ $counter -gt 10 ]
do
echo >> $FILE 
curl $URL >> $FILE 
((counter++))
done

cat $FILE