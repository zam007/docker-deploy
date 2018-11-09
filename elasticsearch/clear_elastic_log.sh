#!/bin/sh

mon=$(date --date='2 month ago' '+%Y%m')

curl -XDELETE 'http://localhost:9200/grouk-*'$mon'*'



