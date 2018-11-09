#!/bin/sh

./dump.sh common app
./dump.sh common access_token
./dump.sh common fileserver
./dump.sh common group
./dump.sh common user
./dump.sh sync sync
./dump.sh msg message

./import.sh grouk app
./import.sh grouk access_token
./import.sh grouk fileserver
./import.sh grouk group
./import.sh grouk user
./import.sh grouk sync
./import.sh grouk message
