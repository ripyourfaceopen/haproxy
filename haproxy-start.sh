#!/bin/bash

if [ $1 == '--help' ]; then
	echo "usage of this script: haproxy <name> <master/slave> <image>"
	exit 0
fi

docker run --name $1 -d -p 443:443 -v $PWD/:/etc/haproxy/ -v $PWD/kad$2:/etc/keepalived/ $3 haproxy -db -f /etc/haproxy/haproxy.cfg

if [ $? != 0 ]; then
	echo "usage of this script: haproxy <name> <master or slave> <image>"
fi

