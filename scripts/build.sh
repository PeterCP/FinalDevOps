#!/bin/bash

# Check that the image name is set.
[ -z $IMAGE_NAME ] && IMAGE_NAME=finaldevops

docker build -t $IMAGE_NAME .
