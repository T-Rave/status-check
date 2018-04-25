#!/bin/bash
## The following script iterates line by line for domains and prints the status code. 30x status code indicates where it wants to redirect to.
## Use: create a directory and place the following code in a .sh file and add url-test.txt with a domain on each line with a final line of "end"

while read LINE; do
  STATUS=$(curl -s -o /dev/null -w '%{http_code}' "$LINE")
  LOCATION=$(curl -L -s -o /dev/null -w '%{url_effective}' "$LINE")
  DOMAIN=$(echo $LINE | awk -F/ '{print $3}')
  SSL=$(curl -s -o /dev/null -w '%{ssl_verify_result}' "$LINE")
  INSECURE=$(curl -s -o /dev/null --insecure -w '%{http_code}' "$LINE")
  IP=$(ping $DOMAIN -c1 | head -1 | grep -Eo '[0-9.]{4,}')
  if [ $STATUS -eq 200 ]; then
    echo "200 - $LINE $IP"
  elif [[ $STATUS =~ ^30[0-9] ]]; then
    echo "$STATUS - $LINE ==> $LOCATION $IP"
  elif [ $SSL = 1 ]; then
    echo "SSL issue - $INSECURE non-secure - $LINE $IP"
  else
  	echo "$STATUS $LINE"
  fi
done < url-test.txt