#!/bin/bash

NAME="$1"
set -e

export PATH=${PATH}:${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/bin

SCRIPT_LIST="
scripts/main.sh
"

for script in $SCRIPT_LIST; do
    if ! bash -n "$script"; then
        exit 2
    fi
done

cat <<EOF >./native/jni/script.hpp
#include "obfuscate.h"
const char *shell_script = OBFUSCATE("$(( for script in $SCRIPT_LIST; do cat "$script"; echo ""; done; ) | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g' | sed 's/$/\\n/g' | tr -d '\n')");
EOF

CXX=${CXX:-aarch64-linux-android31-clang++}

${CXX} \
    native/jni/main.cpp \
    -static \
    -std=c++17 \
    -o "$NAME"



