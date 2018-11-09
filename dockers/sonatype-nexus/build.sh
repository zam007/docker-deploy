#!/bin/sh

docker build -rm -t sonatype-nexus .
docker tag -f sonatype-nexus harbor.tiejin.cn/closer/sonatype-nexus:2.11.4
docker push harbor.tiejin.cn/closer/sonatype-nexus:2.11.4
