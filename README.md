## Shell script compiler

Compile your shell script as executable file. It will aslo obfuscate your shell script. The shell script will be also compiled with standalone mode busybox without depending on `/system/bin/sh`

### How to use

#### CI Build:
1. Fork this repo
2. Write your shell script in `scripts/script.sh`
3. Run GitHub Actions
4. `compiled_script.zip` will be available as github artifact

#### Linux environment:

1. Clone repo
```bash
git clone https://github.com/HuskyDG/shell_script_compiler && cd shell_script_compiler

```
2. Setup Android NDK
```bash
wget https://dl.google.com/android/repository/android-ndk-r23b-linux.zip && unzip android-ndk-r23b-linux.zip
```
3. Build executable
```bash
chmod 777 ./build.sh

mkdir -p bin

ANDROID_NDK_HOME=./android-ndk-r23b CXX=aarch64-linux-android31-clang++ ./build.sh bin/compiled_script_arm64

ANDROID_NDK_HOME=./android-ndk-r23b CXX=armv7a-linux-androideabi31-clang++ ./build.sh bin/compiled_script_arm

ANDROID_NDK_HOME=./android-ndk-r23b CXX=i686-linux-android31-clang++ ./build.sh bin/compiled_script_x86

ANDROID_NDK_HOME=./android-ndk-r23b CXX=x86_64-linux-android31-clang++ ./build.sh bin/compiled_script_x64
```

P/s: This does not have protection yet, please implement it by yourself
