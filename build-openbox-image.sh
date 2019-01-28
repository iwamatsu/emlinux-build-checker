#!/bin/bash

IMAGE=core-image-openbox
BUILD_NAME=build-${IMAGE}

SCRIPT_DIR=$(cd $(dirname $0);pwd)
cd ${SCRIPT_DIR}

. __build_base.sh
