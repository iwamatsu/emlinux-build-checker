#!/bin/bash


BUILD_NAME=core-image-openbox

SCRIPT_DIR=$(cd $(dirname $0);pwd)
cd ${SCRIPT_DIR}

. __repo_info.sh
. __repo_ctrl.sh

if [ "$1" = "update" ]; then
   exit
fi

source repo/poky/oe-init-build-env work/build-${BUILD_NAME}

# delete
bitbake-layers remove-layer meta-poky
bitbake-layers remove-layer meta-yocto-bsp

# add
bitbake-layers add-layer ../../repo/meta-debian
bitbake-layers add-layer ../../repo/meta-debian-extended
bitbake-layers add-layer ../../repo/meta-emlinux
bitbake-layers add-layer ../../repo/meta-openbox
bitbake-layers add-layer ../../repo/meta-openembedded/meta-oe

echo "DISTRO = \"emlinux\"" >> ./conf/local.conf
echo "PACKAGE_CLASSES = \"package_deb\"" >> ./conf/local.conf

echo "DL_DIR = \"\${TOPDIR}/../downloads\"" >> ./conf/local.conf
echo "SSTATE_DIR = \"\${TOPDIR}/../sstate-cache\"" >> ./conf/local.conf

echo "BBMASK = \"meta-debian/recipes-core\"" >> ./conf/local.conf

echo "DISTRO_FEATURES_remove = \" nfc pcmcia 3g zeroconf alsa bluetooth wifi nfs bluez5 pulseaudio wayland vulkan ldconfig\"" >> ./conf/local.conf
