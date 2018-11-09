#!/bin/sh

mongo events --eval "db.dropDatabase();"
mongo config --eval "db.dropDatabase();"
