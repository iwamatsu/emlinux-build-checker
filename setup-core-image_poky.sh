#!/bin/bash

# rootfs: poky
# dist: poky


BUILD_NAME=core-image-minimal-poky

SCRIPT_DIR=$(cd $(dirname $0);pwd)
cd ${SCRIPT_DIR}

. __repo_info.sh
. __repo_ctrl.sh

if [ "$1" = "update" ]; then
   exit
fi

source repo/poky/oe-init-build-env work/build-${BUILD_NAME}

# add
#bitbake-layers add-layer ../../repo/meta-debian
#bitbake-layers add-layer ../../repo/meta-debian-extended
#bitbake-layers add-layer ../../repo/meta-emlinux

#echo "DISTRO = \"emlinux\"" >> ./conf/local.conf
echo "PACKAGE_CLASSES = \"package_deb\"" >> ./conf/local.conf

echo "DL_DIR = \"\${TOPDIR}/../downloads\"" >> ./conf/local.conf
echo "SSTATE_DIR = \"\${TOPDIR}/../sstate-cache\"" >> ./conf/local.conf

# kernel
#echo "LINUX_GIT_PREFIX = \"\"" >> ./conf/local.conf
#echo "LINUX_GIT_URI = \"git://git.kernel.org/pub/scm/linux/kernel/git/cip/\"" >> ./conf/local.conf
#echo "LINUX_GIT_PROTOCOL = \"https\"" >> ./conf/local.conf
#echo "LINUX_GIT_REPO = \"linux-cip.git\"" >> ./conf/local.conf
#echo "LINUX_GIT_SRCREV = \"linux-4.19.y-cip\"" >> ./conf/local.conf