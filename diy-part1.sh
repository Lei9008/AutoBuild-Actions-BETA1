#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i 's/192.168.1.1/192.168.31.1/g' package/base-files/files/bin/config_generate
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default	
sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default	

#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

#修改主机名
sed -i "s/hostname='.*'/hostname='NeWiFi'/g" package/base-files/files/bin/config_generate

##加入作者信息
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='LeiWrt-$(date +%Y%m%d)'/g"  package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION=' By Lei'/g" package/base-files/files/etc/openwrt_release
#cp -af feeds/extraipk/patch/diy/banner-Leiwrt  package/base-files/files/etc/banner

##修改WiFi名
sed -i "s/ImmortalWrt-2.4G/HiWiFi/g" package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i "s/ImmortalWrt-5G/HiWiFi_5G/g" package/mtk/applications/mtwifi-cfg/files/mtwifi.sh

# 简单MESH
git clone https://github.com/ntlf9t/luci-app-easymesh package/luci-app-easymesh
