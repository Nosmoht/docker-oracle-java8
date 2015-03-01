#Q/bin/bash

DOCKER_IMAGE_MAINTAINER="ntbc"
DOCKER_IMAGE_NAME="oracle-java"
DOCKER_IMAGE="${DOCKER_IMAGE_MAINTAINER}/${DOCKER_IMAGE_NAME}"
DOCKER_IMAGE_TAG="latest"

sudo docker build --tag="${DOCKER_IMAGE}" .
sudo docker push ${DOCKER_IMAGE}
