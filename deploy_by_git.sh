#!/bin/sh

repo=$1
dir=$2
if [ -z "$repo" ] || [ -z "$dir" ]
then
    echo "usage: deploy_by_git.sh repo dir"
fi

if [ -d "$dir" ]
then 
    cd $dir
    git pull origin master
else
    mkdir -p $dir
    cd $dir
    git clone $repo .
fi
chown -R nginx.nginx  $dir
