#!/bin/sh
VERSION=$(sed -nE '/^version=/s/^version=//p' module.prop)
EXFATPROGS=${VERSION%-b*}

cat << EOF
## v$VERSION
EOF

if git notes show HEAD 2> /dev/null >&2; then
	git notes show HEAD | sed 's/^/  /'
fi

cat << EOF

### exfatprogs
EOF

sed -nE '/^exfatprogs '"${EXFATPROGS}"'/,/^exfatprogs/{/^(exfatprogs|=+$|$)/d;s/^ \* /   * /;s/^([A-Z].+)\s+:$/ * \L\u\1:/;p}' jni/exfatprogs/NEWS
