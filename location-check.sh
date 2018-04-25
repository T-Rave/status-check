#!/bin/bash
## author - https://stackoverflow.com/a/6136861/1718967
while read LINE; do
  curl -o /dev/null --silent --head --write-out "%{http_code} $LINE ==> %{url_effective}\n" "$LINE"

done < ./url-test.txt