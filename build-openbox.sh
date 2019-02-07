#!/bin/bash

NAME=$(basename $0 | sed -e "s/build-\(.*\)\.sh/\1/g")

SCRIPT_DIR=$(cd $(dirname $0);pwd)
cd ${SCRIPT_DIR}

. __build_base.sh
