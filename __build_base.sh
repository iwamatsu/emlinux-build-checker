
source repo/poky/oe-init-build-env work/build-${IMAGE}

if [ -z ${1} ]; then
    bitbake ${IMAGE}
else
    bitbake -c cleanall $1
    bitbake $1
fi
