#!/bin/bash

TAG=$1

echo "Checking the html contents..."
docker ps
curl -LI localhost:8080 > ./temp.test

FOUND_TXT=$(cat ./temp.test | grep "200 OK")
if [ "$FOUND_TXT" == "" ]; then
   echo "Test failed for jira $TAG!"
   echo "[$(date +%Y-%m-%d-%H-%m-%S)] Test failed for jira $TAG" >> ./logs/tests.log
else
   echo "Test passed for jira $TAG!"
fi

