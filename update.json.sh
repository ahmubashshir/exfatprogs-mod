#!/bin/sh
if ! [ -f module.prop ]; then
	echo "module.prop doesn't exist" >&2
	exit 1
fi

mkdir -p public
VERSION=$(sed -n 's/^version=//p' module.prop)
VERSION_CODE=$(sed -n 's/^versionCode=//p' module.prop)

cat > public/update.json << EOF
{
  "version": "$VERSION",
  "versionCode": $VERSION_CODE,
  "zipUrl": "$REPO/releases/download/$VERSION/exfatprogs.zip"
}
EOF
