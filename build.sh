#!/bin/bash
echo " ";
echo " ";
echo " ";
echo "Setting up 64bit compiler!";
echo " ";
echo " ";
git clone https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9 ~/Toolchain64bit
echo " ";
echo " ";
echo "Setting up 32bit compiler!";
echo " ";
echo " ";
git clone https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9 ~/Toolchain32bit
echo " ";
echo " ";
echo "Exporting for arm64";
##########################################
export ARCH=arm64 
#=================64bit==================#
export CROSS_COMPILE=~/Toolchain64bit/bin/aarch64-linux-android-
#=================32bit==================#
export CROSS_COMPILE_ARM32=~/Toolchain32bit/bin/arm-linux-androideabi-
##########################################
echo " ";
echo " ";
echo "Cleaning old directories";
rm -rf out
rm -rf ~/custom_kernel
echo " ";
echo " ";
echo "Creating new directories";
mkdir out
mkdir ~/custom_kernel
echo " ";
echo " ";
echo " ";
echo "Build the kernel!";
echo " ";
echo " ";
##########################################
make -C $(pwd) O=out tissot_defconfig
make -j4 -C $(pwd) O=out
##########################################
echo " ";
echo " ";
echo " ";
echo "Copying Image to output folder";
cp out/arch/arm64/boot/Image.gz-dtb ~/custom_kernel/Image.gz-dtb

