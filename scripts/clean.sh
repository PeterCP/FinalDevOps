#!/bin/bash

# Check that the image name is set.
[ -z $IMAGE_NAME ] && IMAGE_NAME=finaldevops

# Gracefully stop all running containers.
running=$(docker ps -q --filter ancestor=$IMAGE_NAME)
if ! [ -z $running ]; then
	docker stop $running
fi

# Remove all containers.
running=$(docker ps -q --filter ancestor=$IMAGE_NAME)
if ! [ -z $running ]; then
	docker rm -f $running
fi
