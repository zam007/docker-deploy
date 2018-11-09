#!/bin/bash

default_images="umscloud-base umscloud-mysql umscloud-redis umscloud-teamcity-base umscloud-teamcity"
images=${1:-$default_images}
for filename in ${images}
do
	echo ${filename}
	cd ${filename}
	docker build --rm=true -t ${filename} .
	docker tag -f ${filename} harbor.tiejin.cn/${filename}
	docker push harbor.tiejin.cn/${filename}
	cd ..
done
