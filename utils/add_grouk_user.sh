#!/usr/bin/env bash
shopt -o -s xtrace

if [ $# != 1 ] ; then
echo "USAGE: $0 username"
exit 1;
fi

cd
mkdir user
cd user

ssh-keygen -t rsa -f $1_key -N grouk
useradd $1
su $1  <<EOF
cp $1_key.pub ~
cd
mkdir .ssh
cat $1_key.pub >>.ssh/authorized_keys 
EOF
