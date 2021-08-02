#/bin/bash

sudo apt-get update
sudo apt-get upgrade

sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget curl swig rsync

git clone https://github.com/openwrt/openwrt.git

cd openwrt

./scripts/feeds update -a
./scripts/feeds install -a

git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
svn checkout https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
git clone https://github.com/hubutui/p7zip-lede.git package/p7zip-lede

rm -rf ./target/linux/rockchip
svn checkout https://github.com/immortalwrt/immortalwrt/branches/master/target/linux/rockchip target/linux/rockchip
rm -rf ./package/boot/uboot-rockchip
svn checkout https://github.com/immortalwrt/immortalwrt/branches/master/package/boot/uboot-rockchip package/boot/uboot-rockchip
svn checkout https://github.com/immortalwrt/immortalwrt/branches/master/package/boot/arm-trusted-firmware-rk3328 package/boot/arm-trusted-firmware-rk3328

make menuconfig

echo -e "\033[33mPrepare to make download......\033[0m"
sleep 5s
echo -e "\033[33mBegin to make download\033[0m"

make download -j$(($(nproc) + 1)) V=s

echo -e "\033[33mPrepare to make......\033[0m"
sleep 5s
echo -e "\033[33mBegin to make......\033[0m"

make -j$(($(nproc) + 1)) || make -j1 || make -j1 V=s

if [ "$?" == "0" ]; then
    echo -e "\033[32mCompile success!\033[0m"
    exit 0
else
    echo -e "\033[31mCompile failed!\033[0m"
    exit 1
fi
