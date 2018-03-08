#!/bin/bash

docker image rm govtnz/docker-sonar-scanner:3
docker build -t govtnz/docker-sonar-scanner:3 .
