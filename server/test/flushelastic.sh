#!/bin/sh

curl -XDELETE 127.0.0.1:9200/_all
curl -XDELETE 127.0.0.1:19200/_all