#!/bin/bash

# Check that the image name is set.
[ -z $IMAGE_NAME ] && IMAGE_NAME=finaldevops

docker run --rm -d -p 80:80 $IMAGE_NAME
