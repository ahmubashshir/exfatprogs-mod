#!sh
SKIPUNZIP=1
case "$ARCH" in
	arm)	LIBS=armeabi-v7a;;
	x86)    LIBS=x86;;
	arm64)	LIBS=arm64-v8a;;
	x86_64)	LIBS=x86_64;;
	*) abort "Unsupported architecture: $ARCH";;
esac

ui_print "Installing for $LIBS"
mkdir -p "$MODPATH/system/bin"
unzip -o  "$ZIPFILE" "module.prop"   -d "$MODPATH"
unzip -o  "$ZIPFILE" "sepolicy.rule" -d "$MODPATH"
unzip -oj "$ZIPFILE" "libs/$LIBS/*"  -d "$MODPATH/system/bin"

ui_print 'Fixing Selinux Labels'
chcon u:object_r:fsck_exec:s0 "$MODPATH/system/bin/fsck.exfat"
chcon u:object_r:mkfs_exec:s0 "$MODPATH/system/bin/mkfs.exfat"

ui_print 'Fixing groups'
chgrp shell "$MODPATH/system/bin/fsck.exfat"
chgrp shell "$MODPATH/system/bin/mkfs.exfat"
chgrp shell "$MODPATH/system/bin/tune.exfat"
chgrp shell "$MODPATH/system/bin/exfatlabel"

ui_print 'Cleaning up residues'
rm -f "${MODPATH}/customize.sh"
