#!/bin/bash

NAME=$(basename $0 | sed -e "s/build-\(.*\)\.sh/\1/g")
__IMAGE=$(basename $0 | sed -e "s/build-\(.*\)_\(.*\)_\(.*\)\.sh/\1/g")
DIST=$(basename $0 | sed -e "s/build-\(.*\)_\(.*\)_\(.*\)\.sh/\3/g")

IMAGE=core-image-${__IMAGE}
BUILD_NAME=build-${NAME}

SCRIPT_DIR=$(cd $(dirname $0);pwd)
cd ${SCRIPT_DIR}

. __build_base.sh
