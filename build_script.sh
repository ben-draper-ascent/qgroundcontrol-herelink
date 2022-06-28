#!/bin/bash

sudo apt-get update && sudo apt-get install wget curl    speech-dispatcher    libgstreamer-plugins-base1.0-dev     libgstreamer1.0-0:amd64     libgstreamer1.0-dev     libudev-dev android-sdk


export GSTREAMER_NAME='arm64'
export BITNESS='64'

export SOURCE_FOLDER=$PWD
export ANDROID_HOME=/usr/lib/android-sdk
export PATH=$ANDROID_HOME/tools/bin:$PATH

export BITNESS='64'
export GSTREAMER_NAME='arm64'

export SHADOW_BUILD_DIR=$SOURCE_FOLDER/build/qgc/
export CODESIGN=nocodesign
export SPEC=android-clang
export CONFIG=installer


git submodule update --init --recursive
                   
rm -rf $SHADOW_BUILD_DIR
 
# wget https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip
# sudo unzip commandlinetools-linux-6609375_latest.zip -d cmdline-tools
# sudo mkdir --parents "$ANDROID_HOME/cmdline-tools/latest"
# sudo mv cmdline-tools/* "$ANDROID_HOME/cmdline-tools/latest/"
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH


# if [ ! -f "/tmp/gstreamer-1.0-android-${GSTREAMER_NAME}-1.14.4.tar.bz2" ]; then
# 	wget -N --quiet https://s3-us-west-2.amazonaws.com/qgroundcontrol/dependencies/gstreamer-1.0-android-${GSTREAMER_NAME}-1.14.4.tar.bz2 -O /tmp/gstreamer-1.0-android-${GSTREAMER_NAME}-1.14.4.tar.bz2
# 	tar jxf /tmp/gstreamer-1.0-android-${GSTREAMER_NAME}-1.14.4.tar.bz2
# fi

# if [ ! -f "/tmp/android-ndk-r20-linux-x86_64.zip" ]; then
#     wget -N --quiet https://dl.google.com/android/repository/android-ndk-r20-linux-x86_64.zip -O /tmp/android-ndk-r20-linux-x86_64.zip
#     unzip /tmp/android-ndk-r20-linux-x86_64.zip > /dev/null
# fi


export ANDROID_NDK_ROOT=/home/bendraper/qgcFork/qgroundcontrol-herelink/android-ndk-r20 
export ANDROID_SDK_ROOT=/usr/lib/android-sdk
export PATH=/home/bendraper/qgcFork/qgroundcontrol-herelink/android-ndk-r20:$PATH

# if [ ! -f "/tmp/Qt5.12.6-android_arm64_v8a-min.tar.bz2" ]; then
# 	wget --quiet https://s3-us-west-2.amazonaws.com/qgroundcontrol/dependencies/Qt5.12.6-android_arm64_v8a-min.tar.bz2 -O /tmp/Qt5.12.6-android_arm64_v8a-min.tar.bz2
# 	tar jxf /tmp/Qt5.12.6-android_arm64_v8a-min.tar.bz2 -C /tmp 
# fi

export PATH=/tmp/Qt5.12-android_arm64_v8a/5.12.6/android_arm64_v8a/bin:$PATH

# Prepare required dependencies and environmental variables
sudo /usr/lib/android-sdk/cmdline-tools/latest/tools/bin/sdkmanager  --sdk_root="/usr/lib/android-sdk" --uninstall "platforms;android-31" "platforms;android-30" "platforms;android-29" "build-tools;31.0.0" "build-tools;30.0.0" "build-tools;25.0.3" "build-tools;32.0.0"

sudo /usr/lib/android-sdk/cmdline-tools/latest/tools/bin/sdkmanager  --sdk_root="/usr/lib/android-sdk" "build-tools;25.0.3" "platforms;android-29" "platform-tools"


#### All the above should be take care of in docker, namely:
####  - Install dependencies
####  - Install java8 and activate it
####  - Download and unzip gstreamer, android ndk and qt5.12
####  - Install android sdk and setup android-29 and build tools 25.0.3
####  - Checkout repository

# Compute version number
./tools/update_android_version.sh ${BITNESS} notmaster

# Build
mkdir -p ${SHADOW_BUILD_DIR} 
cd ${SHADOW_BUILD_DIR}

export STABLE_OR_DAILY=StableBuild

qmake -r $SOURCE_FOLDER/qgroundcontrol.pro CONFIG+=${CONFIG} CONFIG+=${STABLE_OR_DAILY} -spec ${SPEC}
       
make -j16 VERBOSE=1 install INSTALL_ROOT=./release/android-build/
