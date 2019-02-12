
tmpfile=$(mktemp "/tmp/${0##*/}.tmp.XXXXXX")
datadir=${PWD}/base-data

# tree
(cd `ls -d work/${BUILD_NAME}/tmp-glibc/work/*/${IMAGE}/1.0-r0/rootfs/`; LANG=C find . -name "*"  | sort > ${tmpfile}.tree)

# recipe
cd work/${BUILD_NAME}/tmp-glibc/work/
for d in `ls -1` ; do
    echo $d
    ls -1 $d >> ${tmpfile}
done
cat ${tmpfile} | sort | uniq > $tmpfile.recipes
cd -

# diff
diff -urN ${tmpfile}.tree ${datadir}/${IMAGE}.tree
diff -urN ${tmpfile}.recipes ${datadir}/${IMAGE}.recipes

return 0
