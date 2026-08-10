#!/bin/sh
REBUILD=2

VERSION=$(
	sed -nE '/EXFAT_PROGS_VERSION/s/^.+ "([[:alnum:].-]+)".*$/\1/p' jni/exfatprogs/include/version.h
)

RELEASE=$(
	sed -nE '/E2FSPROGS_VERSION/s/^.+ "([[:alnum:].-]+)".*$/\1/p' jni/blkid_e2fsprogs/version.h |
		sed -E 's/^([0-9]+)\.([0-9]+)\.([0-9]+)$/\1 * 1000 + \2 * 10 + \3/' |
		xargs expr
)

VERSION_CODE=$(
	echo "$VERSION" |
		sed -E 's/^([0-9]+)\.([0-9]+)\.([0-9]+)$/\1 * 100000000 + \2 * 1000000 + \3 * 10000/' |
		sed "s/$/ + $RELEASE + $REBUILD/" |
		xargs expr
)

if test "$REBUILD" -eq 0; then
	unset REBUILD
fi

cat << EOF
id=exfatprogs
name=exfatprogs
version=$VERSION-b$RELEASE${REBUILD:+.$REBUILD}
versionCode=$VERSION_CODE
author=Mubashshir
description=exfatprogs Update package for android
EOF
