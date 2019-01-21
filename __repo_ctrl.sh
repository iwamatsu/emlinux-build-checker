if [ ! -d repo ] ; then
    mkdir repo
fi
if [ ! -d work ] ; then
    mkdir work
fi

if [ ! -e repo/meta-debian ] ; then
    git clone -b for-thud-devel $REPO_META_DEBIAN repo/meta-debian
else
    cd repo/meta-debian; git remote update; git reset --hard origin/for-thud-devel; cd ../../
fi

if [ ! -e repo/meta-debian-extended ] ; then
    git clone $REPO_META_DEBIAN_EXTENDED repo/meta-debian-extended
else
    cd repo/meta-debian-extended; git remote update; git reset --hard origin/master; cd ../../
fi

if [ ! -e repo/poky ] ; then
    git clone -b iwamatsu/libxxf86misc $REPO_POKY repo/poky
else
    cd repo/poky; git remote update; git reset --hard origin/iwamatsu/libxxf86misc; cd ../../
fi

if [ ! -e repo/meta-emlinux ] ; then
    git clone $REPO_META_EMLINUX repo/meta-emlinux
else
    cd repo/meta-emlinux; git remote update; git reset --hard origin/master; cd ../../
fi

if [ ! -e repo/meta-openbox ] ; then
    git clone $REPO_META_OPENBOX repo/meta-openbox
else
    cd repo/meta-openbox; git remote update; git reset --hard origin/master; cd ../../
fi

if [ ! -e repo/meta-openembedded ] ; then
    git clone -b thud $REPO_META_OE repo/meta-openembedded
else
    cd repo/meta-openembedded;git remote update; git reset --hard origin/thud; cd ../../
fi
