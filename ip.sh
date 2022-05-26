#!/bin/sh

echo "mysql ip info:"
docker inspect portable-mysql57 | grep IPAddres

echo "redis inp info:"
docker inspect portable-redis7 | grep IPAddres