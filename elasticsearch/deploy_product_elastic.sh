#!/bin/sh

java -Xms10g -Xmx10g -Djava.awt.headless=true -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=75 -XX:+UseCMSInitiatingOccupancyOnly -XX:+HeapDumpOnOutOfMemoryError -XX:+DisableExplicitGC -Dfile.encoding=UTF-8 -Djna.nosys=true -Des.path.home=/data/grouk-elastic-2.2 -cp /data/grouk-elastic-2.2/lib/elasticsearch-2.2.0.jar:/data/grouk-elastic-2.2/lib/* org.elasticsearch.bootstrap.Elasticsearch start -Des.insecure.allow.root=true -d
