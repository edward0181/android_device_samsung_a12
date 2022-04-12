#!/bin/bash
WORKSPACE=~/twrp
TWRP_SOURCE=https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git
TWRP_BRANCH=twrp-11
DEVICE_CODE=a12
DEVICE_MANUFACTURER=samsung
DEVICE_SOURCE=https://https://github.com/edward0181/android_device_samsung_a12
DT_DIR=device/$DEVICE_MANUFACTURER/$DEVICE_CODE
GIT_USER_NANE=edward0181
GIT_USER_EMAIL=edwardroggeveen@gmail.com
GIT_COLOR_UI=false
###################################################################################
git config --global user.name $GIT_USER_NANE
git config --global user.email $GIT_USER_EMAIL
git config --global color.ui $GIT_COLOR_UI

java -version
update-java-alternatives

if [ ! -d ~/bin ]; then
    echo "[I] Setting up repo !"
    mkdir ~/bin
fi

PATH=~/bin:$PATH
source ~/.bashrc
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo

if [ ! -d $WORKSPACE ]; then
    echo "[I] Setting up TWRP source !"
    mkdir -p $WORKSPACE
fi

cd $WORKSPACE
sudo apt-get install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev python
sudo add-apt-repository 'deb http://cz.archive.ubuntu.com/ubuntu trusty main'
sudo add-apt-repository 'deb http://cz.archive.ubuntu.com/ubuntu/ trusty main universe'
sudo add-apt-repository 'deb http://cz.archive.ubuntu.com/ubuntu/ trusty-updates main universe'
sudo add-apt-repository 'deb http://security.ubuntu.com/ubuntu trusty main restricted universe multiverse'
sudo add-apt-repository 'deb http://security.ubuntu.com/ubuntu trusty-security main restricted universe multiverse'
sudo apt-get update
sudo apt-get upgrade -y

repo init --depth=1 -u $TWRP_SOURCE -b $TWRP_BRANCH
repo sync >log 2>&1
wget https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/android-9.0.0_r1/clang-4691093.tar.gz
tar xvf clang-4691093.tar.gz
mkdir -p prebuilts/clang/host/linux-x86/
mv -rf clang-4691093 prebuilts/clang/host/linux-x86/

if [ ! -d $DT_DIR ]; then
    echo "[I] Setting up device tree !"
    mkdir -p $DT_DIR
    git clone $DEVICE_SOURCE $DT_DIR
fi
echo "[I] Preparing for build !"
export ALLOW_MISSING_DEPENDENCIES=true
source build/envsetup.sh
lunch twrp_$DEVICE_CODE-eng
echo "[I] Build started !"
mka recoveryimage
curl --upload-file ./out/target/product/a12/recovery.img https://transfer.sh/twrp-a12-001.img
