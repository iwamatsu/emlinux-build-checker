#!/bin/bash

NAME=$(basename $0 | sed -e "s/build-\(.*\)\.sh/\1/g")

IMAGE=core-image-${NAME}
BUILD_NAME=build-${NAME}

SCRIPT_DIR=$(cd $(dirname $0);pwd)
cd ${SCRIPT_DIR}

. __build_base.sh
