#!/bin/bash

BASE_URI="https://gitlab.miraclelinux.com/emlinux"
REPO_POKY="${BASE_URI}/poky.git"
REPO_META_DEBIAN="${BASE_URI}/meta-debian.git"
REPO_META_DEBIAN_EXTENDED="${BASE_URI}/meta-debian-extended.git"
REPO_META_EMLINUX="${BASE_URI}/meta-emlinux.git"
REPO_META_OPENBOX="${BASE_URI}/meta-openbox.git"
REPO_META_OE="https://github.com/openembedded/meta-openembedded.git"
IMAGE=core-image-openbox

SCRIPT_DIR=$(cd $(dirname $0);pwd)
cd ${SCRIPT_DIR}

if [ ! -d repo ] ; then
    mkdir repo
fi
if [ ! -d work ] ; then
    mkdir work
fi

. __repo_ctrl.sh

if [ "$1" = "update" ]; then
   exit
fi

source repo/poky/oe-init-build-env work/build-${IMAGE}

# delete
bitbake-layers remove-layer meta-poky
bitbake-layers remove-layer meta-yocto-bsp

# add
bitbake-layers add-layer ../../repo/meta-debian
bitbake-layers add-layer ../../repo/meta-debian-extended
bitbake-layers add-layer ../../repo/meta-emlinux

echo "DISTRO = \"emlinux\"" >> ./conf/local.conf
echo "PACKAGE_CLASSES = \"package_deb\"" >> ./conf/local.conf

echo "DL_DIR = \"\${TOPDIR}/../downloads\"" >> ./conf/local.conf
echo "SSTATE_DIR = \"\${TOPDIR}/../sstate-cache\"" >> ./conf/local.conf
