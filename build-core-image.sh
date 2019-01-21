#!/bin/bash

IMAGE=core-image-minimal

SCRIPT_DIR=$(cd $(dirname $0);pwd)
cd ${SCRIPT_DIR}

. __build_base.sh
