if [ ! -d repo ] ; then
    mkdir repo
fi
if [ ! -d work ] ; then
    mkdir work
fi

if [ ! -e repo/meta-debian ] ; then
    git clone -b $REPO_META_DEBIAN_BRANCH $REPO_META_DEBIAN repo/meta-debian
else
    cd repo/meta-debian; git remote update; git reset --hard origin/$REPO_META_DEBIAN_BRANCH; cd ../../
fi

if [ ! -e repo/meta-debian-extended ] ; then
    git clone -b $REPO_META_DEBIAN_EXTENDED_BRANCH $REPO_META_DEBIAN_EXTENDED repo/meta-debian-extended
else
    cd repo/meta-debian-extended; git remote update; git reset --hard origin/$REPO_META_DEBIAN_EXTENDED_BRANCH; cd ../../
fi

if [ ! -e repo/poky ] ; then
    git clone -b $REPO_POKY_BRANCH $REPO_POKY repo/poky
else
    cd repo/poky; git remote update; git reset --hard origin/$REPO_POKY_BRANCH; cd ../../
fi

if [ ! -e repo/meta-emlinux ] ; then
    git clone -b $REPO_META_EMLINUX_BRANCH $REPO_META_EMLINUX repo/meta-emlinux
else
    cd repo/meta-emlinux; git remote update; git reset --hard origin/$REPO_META_EMLINUX_BRANCH; cd ../../
fi

if [ ! -e repo/meta-openbox ] ; then
    git clone -b $REPO_META_OPENBOX_BRANCH $REPO_META_OPENBOX repo/meta-openbox
else
    cd repo/meta-openbox; git remote update; git reset --hard origin/$REPO_META_OPENBOX_BRANCH; cd ../../
fi

if [ ! -e repo/meta-openembedded ] ; then
    git clone -b $REPO_META_OE_BRANCH $REPO_META_OE repo/meta-openembedded
else
    cd repo/meta-openembedded;git remote update; git reset --hard origin/$REPO_META_OE_BRANCH; cd ../../
fi
