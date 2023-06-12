#!/bin/bash

NAME="$1"
set -e

export PATH=${PATH}:${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/bin

cat <<EOF >./native/jni/script.hpp
#include "obfuscate.h"
const char *shell_script = OBFUSCATE("$(cat ./scripts/script.sh | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g' | sed 's/$/\\n/g' | tr -d '\n')");
EOF

CXX=${CXX:-aarch64-linux-android31-clang++}

${CXX} \
    native/jni/main.cpp \
    -static \
    -std=c++17 \
    -o "$NAME"



