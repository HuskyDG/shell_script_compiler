#!/usr/bin/env bash

set -euo pipefail

build_mode="${1:-release}"

cd "$(dirname "$0")"
rm -rf tmp
mkdir tmp

cat <<EOF >./native/jni/script.hpp
#include "obfuscate.h"
const char *shell_script = OBFUSCATE("$(cat ./scripts/script.sh | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g')");
EOF

pushd native
rm -fr libs obj
debug_mode=1
if [[ "$build_mode" == "release" ]]; then
    debug_mode=0
fi
ndk-build -j4 NDK_DEBUG=$debug_mode
popd