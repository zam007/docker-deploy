#!/bin/sh

day=${1:-7}
default_dir="/data2/logs/"
dir=${2:-${default_dir}}
echo "clear $day day before log, in dir $dir"
find ${dir} -mtime +$day -name "*.log*" -exec echo "del " {} \; -exec rm -f {} \;
