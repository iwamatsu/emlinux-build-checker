#!/bin/bash

IMAGE=core-image-minimal
SCRIPT_DIR=$(cd $(dirname $0);pwd)

cd ${SCRIPT_DIR}

source repo/poky/oe-init-build-env work/build-${IMAGE}

if [ -z ${1} ]; then
    bitbake ${IMAGE}
else
    bitbake -k $1
fi
