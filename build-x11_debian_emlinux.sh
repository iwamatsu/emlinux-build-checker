#!/bin/bash

DEPLOY_BASE_DIR=:/opt/built-emlinux
BUILD_DATE=`date +%Y%m%d%H%M`
NAME=$(basename $0 | sed -e "s/build-\(.*\)\.sh/\1/g")
__IMAGE=$(basename $0 | sed -e "s/build-\(.*\)_\(.*\)_\(.*\)\.sh/\1/g")
DIST=$(basename $0 | sed -e "s/build-\(.*\)_\(.*\)_\(.*\)\.sh/\3/g")

IMAGE=core-image-${__IMAGE}
BUILD_NAME=build-${NAME}

SCRIPT_DIR=$(cd $(dirname $0);pwd)
cd ${SCRIPT_DIR}

. __build_base.sh

# copy data
if [ $? -eq 0 ] ; then
    mkdir -p ${DEPLOY_BASE_DIR}/${BUILD_DATE}
    cp -rf tmp-glibc/deploy/images/${MACHINE} ${DEPLOY_BASE_DIR}/${BUILD_DATE}/.
fi

# check rootfs
cd ${SCRIPT_DIR}
if [ $? -eq 0 ] ; then
. __check_rootfs.sh
fi
