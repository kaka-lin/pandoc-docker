#!/bin/bash

CONTAINER_REGISTRY="kakalin"
CONTAINER_REPOSITORY="pandoc"
CONTAINER_TAG="2.19_textlive"

docker build --rm -t $CONTAINER_REGISTRY/$CONTAINER_REPOSITORY:$CONTAINER_TAG .
