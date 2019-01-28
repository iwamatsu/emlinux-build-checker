#!/bin/bash

# rootfs: meta-debian + meta-debian-extended
# dist: poky

BASE_URI="https://gitlab.miraclelinux.com/emlinux"
REPO_POKY="${BASE_URI}/poky.git"
REPO_META_DEBIAN="${BASE_URI}/meta-debian.git"
REPO_META_DEBIAN_EXTENDED="${BASE_URI}/meta-debian-extended.git"
REPO_META_EMLINUX="${BASE_URI}/meta-emlinux.git"
REPO_META_OPENBOX="${BASE_URI}/meta-openbox.git"
REPO_META_OE="https://github.com/openembedded/meta-openembedded.git"
IMAGE=core-image-minimal-emlinux-poky

SCRIPT_DIR=$(cd $(dirname $0);pwd)
cd ${SCRIPT_DIR}

. __repo_ctrl.sh

if [ "$1" = "update" ]; then
   exit
fi

source repo/poky/oe-init-build-env work/build-${IMAGE}

# add
bitbake-layers add-layer ../../repo/meta-debian
bitbake-layers add-layer ../../repo/meta-debian-extended

echo "PACKAGE_CLASSES = \"package_deb\"" >> ./conf/local.conf

echo "DL_DIR = \"\${TOPDIR}/../downloads\"" >> ./conf/local.conf
echo "SSTATE_DIR = \"\${TOPDIR}/../sstate-cache\"" >> ./conf/local.conf

# kernel
echo "LINUX_GIT_PREFIX = \"\"" >> ./conf/local.conf
echo "LINUX_GIT_URI = \"git://git.kernel.org/pub/scm/linux/kernel/git/cip/\"" >> ./conf/local.conf
echo "LINUX_GIT_PROTOCOL = \"https\"" >> ./conf/local.conf
echo "LINUX_GIT_REPO = \"linux-cip.git\"" >> ./conf/local.conf
echo "LINUX_GIT_SRCREV = \"linux-4.19.y-cip\"" >> ./conf/local.conf
