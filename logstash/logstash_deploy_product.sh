#!/bin/bash

sh $(cd `dirname $0`; pwd)/logstash_base_deploy.sh closer_es_product 10.0.0.118:9200
