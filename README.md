# Status Check
## A simple HTTP status code checker
This tool is to help check one or more sites HTTP status codes. The hope is for it to return a 200, meaning all is good. If a 30x redirect is detected it'll note where the domain is looking to resolve from. 

SSL check? Sure thing! If a 000 status code is returned, which appears to happen if the SSL handshake fails this script will attempt to check the insecure version for its status code.

### Use
- Domains to test: use the url-test.txt file to add a URL to test. 1 URL per line and leave one blank line at the end of file or leave the default `end`. Without that it will miss the last URL.
- Running: This is in the form of a bash script so you will need to run from a terminal session `bash status-check.sh`. This is to be ran after the url-test.txt file updated

### Resources
- [cURL options for more Available --write-out variables](https://ec.haxx.se/usingcurl-verbose.html)
- [Overview of using Bash in this context](http://blog.likewise.org/2011/08/brushing-up-on-curl/)
- [Example that helped get this started](https://coderwall.com/p/taqiyg/use-http-status-codes-from-curl)
