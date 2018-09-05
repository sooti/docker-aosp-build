#!/bin/bash

echo "lunch flavor: $1"

make clobber
source build/envsetup.sh
lunch $1
make -j8
mmm development/tools/idegen
development/tools/idegen/idegen.sh
chmod -R 777 .



