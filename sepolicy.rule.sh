#!/bin/sh
cat << EOF
#============= fsck_untrusted ==============
allow fsck_untrusted sysfs file read;

#============= vold ==============
allow vold fsck_untrusted process2 nosuid_transition;
EOF
