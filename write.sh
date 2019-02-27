#!/bin/sh
. ./lib.sh # load lib
[ $2 -gt 0 ] && echo $2 > $(name $1) # if arg is ok write it