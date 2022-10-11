#!/bin/sh -e

# $2 = version
VERSION=$2
ZIP=$3
TAR=../libstax-java_$VERSION.orig.tar.gz
DIR=stax-$VERSION.orig

echo $VERSION
echo $ZIP
echo $TAR

# clean up the upstream tarball
unzip $ZIP -d $DIR
GZIP=--best tar -c -z -f $TAR --exclude '*.jar' --exclude '*/src/javax/xml/namespace/*' $DIR
rm -rf $DIR
rm $ZIP

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
  . .svn/deb-layout
  mv $TAR $origDir
  echo "moved $TAR to $origDir"
fi
