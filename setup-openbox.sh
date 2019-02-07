#!/bin/bash

# dist: poky
# rootfs: oe
# image: core-image-openbox

NAME=$(basename $0 | sed -e "s/setup-\(.*\)\.sh/\1/g")

SCRIPT_DIR=$(cd $(dirname $0);pwd)
cd ${SCRIPT_DIR}

. __repo_info.sh
. __repo_ctrl.sh

if [ "$1" = "update" ]; then
   exit
fi

source repo/poky/oe-init-build-env work/build-${NAME}

if [ ! -e ./conf/bblayers.conf.orig ] ; then
    cp ./conf/bblayers.conf ./conf/bblayers.conf.orig

    # add
    bitbake-layers add-layer ../../repo/meta-openbox
    bitbake-layers add-layer ../../repo/meta-openembedded/meta-oe
fi

if [ ! -e ./conf/local.conf.orig ] ; then
    cp ./conf/local.conf ./conf/local.conf.orig

    echo "PACKAGE_CLASSES = \"package_deb\"" >> ./conf/local.conf
    echo "DL_DIR = \"\${TOPDIR}/../downloads\"" >> ./conf/local.conf
    echo "SSTATE_DIR = \"\${TOPDIR}/../sstate-cache\"" >> ./conf/local.conf
fi
