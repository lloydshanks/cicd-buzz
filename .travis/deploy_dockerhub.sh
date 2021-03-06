#!/bin/sh
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
if ["$TRAVIS_BRAND" = "master"]; then
	TAG="latest"
else
	TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t $DOCKER_USER/$DOCKER_REPO:$TAG .
docker push $DOCKER_USER/$DOCKER_REPO
