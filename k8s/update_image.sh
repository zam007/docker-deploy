#!/bin/sh

for image in `grep image: *.yaml|awk -F"image:" '{print $2}'`
do
	echo  "pull $image"
	docker pull ${image}
done
