#!/bin/bash

if [ ! -d repo ] ; then
    mkdir repo
fi
if [ ! -d work ] ; then
    mkdir work
fi

if [ ! -e repo/meta-debian ] ; then
    git clone -b for-thud-devel git@github.com:iwamatsu/meta-debian.git repo/meta-debian
    # git clone -b master https://github.com/meta-debian/meta-debian.git
fi

if [ ! -e repo/meta-debian-extended ] ; then
    git clone https://github.com/iwamatsu/meta-debian-extended.git repo/meta-debian-extended
fi

if [ ! -e repo/poky ] ; then
    git clone -b libxxf86misc git@github.com:iwamatsu/poky.git repo/poky
fi

if [ ! -e repo/meta-emlinux ] ; then
    git clone https://github.com/iwamatsu/meta-emlinux.git repo/meta-emlinux
fi

if [ ! -e repo/meta-openbox ] ; then
    git clone https://github.com/iwamatsu/meta-openbox.git repo/meta-openbox
fi

if [ ! -e repo/meta-openembedded ] ; then
    git clone -b thud git://git.openembedded.org/meta-openembedded repo/meta-openembedded
fi

IMAGE=core-image-openbox

source repo/poky/oe-init-build-env work/build-${IMAGE}

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
echo "MACHINE = \"qemuarm\"" >> ./conf/local.conf

echo "DL_DIR = \"\${TOPDIR}/../downloads\"" >> ./conf/local.conf
echo "SSTATE_DIR = \"\${TOPDIR}/../sstate-cache\"" >> ./conf/local.conf

echo "DISTRO_FEATURES_remove = \" nfc pcmcia 3g zeroconf alsa bluetooth wifi nfs bluez5 pulseaudio wayland vulkan ldconfig\"" >> ./conf/local.conf
