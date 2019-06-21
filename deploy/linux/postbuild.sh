#!/bin/sh
set -e

DIRNAME=$(cd `dirname $0` && pwd)
cd $DIRNAME/../../out/Release/

echo "Post Build: Making Qode portable..."

mkdir -p ./linux/lib

cp -rf $QT_INSTALL_DIR/lib/libQt5Core.so* ./linux/lib/
cp -rf $QT_INSTALL_DIR/lib/libQt5Gui.so* ./linux/lib/
cp -rf $QT_INSTALL_DIR/lib/libQt5Widgets.so* ./linux/lib/

cp ./qode ./linux/qode

cd ./linux

strip qode

patchelf --set-rpath "\$ORIGIN/lib" qode

echo "Qode is ready!"