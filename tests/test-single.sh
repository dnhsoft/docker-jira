#!/bin/bash

TAG=$1

echo "Starting test of jira $TAG..."

mkdir -p logs

docker build --no-cache -t jiratest:$TAG ./../$TAG

#echo "Starting jira $TAG container..."
docker run -d --name jiratest -p 8080:80 jiratest:$TAG

./test-html-content.sh $TAG

#echo "Killing jira $TAG container and images..."
docker stop jiratest
docker rm jiratest
docker rmi jiratest:$TAG

echo "Finished test of jira $TAG"