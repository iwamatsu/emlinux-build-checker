#!/bin/bash

IMAGE=core-image-minimal
BUILD_NAME=build-core-image-minimal-emlinux-poky

SCRIPT_DIR=$(cd $(dirname $0);pwd)
cd ${SCRIPT_DIR}

. __build_base.sh
