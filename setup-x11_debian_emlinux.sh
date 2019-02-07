#!/bin/bash

# dist: emlinux
# rootfs: meta + meta-debian + meta-debian-extended
# image: core-image-x11

NAME=$(basename $0 | sed -e "s/setup-\(.*\)\.sh/\1/g")
DIST=$(basename $0 | sed -e "s/setup-\(.*\)_\(.*\)_\(.*\)\.sh/\3/g")

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

    # delete
    bitbake-layers remove-layer meta-poky
    bitbake-layers remove-layer meta-yocto-bsp

    bitbake-layers add-layer ../../repo/meta-debian
    bitbake-layers add-layer ../../repo/meta-debian-extended
    bitbake-layers add-layer ../../repo/meta-emlinux
fi

if [ ! -e ./conf/local.conf.orig ] ; then
    cp ./conf/local.conf ./conf/local.conf.orig

    echo "DISTRO = \"${DIST}\"" >> ./conf/local.conf
    echo "PACKAGE_CLASSES = \"package_deb\"" >> ./conf/local.conf

    echo "DL_DIR = \"\${TOPDIR}/../downloads\"" >> ./conf/local.conf
    echo "SSTATE_DIR = \"\${TOPDIR}/../sstate-cache\"" >> ./conf/local.conf

    echo "BBMASK = \"meta-debian/recipes-core\"" >> ./conf/local.conf
    echo "BBMASK .= \"|meta-debian-extended/recipes-debian/base-files/base-files_debian.bb\"" >> ./conf/local.conf

    # kernel
    echo "LINUX_GIT_PREFIX = \"\"" >> ./conf/local.conf
    echo "LINUX_GIT_URI = \"git://git.kernel.org/pub/scm/linux/kernel/git/cip/\"" >> ./conf/local.conf
    echo "LINUX_GIT_PROTOCOL = \"https\"" >> ./conf/local.conf
    echo "LINUX_GIT_REPO = \"linux-cip.git\"" >> ./conf/local.conf
    echo "LINUX_GIT_SRCREV = \"linux-4.19.y-cip\"" >> ./conf/local.conf

    echo "DISTRO_FEATURES_remove = \" nfc pcmcia 3g zeroconf alsa bluetooth wifi nfs bluez5 pulseaudio wayland vulkan ldconfig\"" >> ./conf/local.conf
fi
