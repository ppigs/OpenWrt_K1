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

# 取消注释 feed 源
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# 添加 feed 源
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# adguardhome插件
# git clone https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-adguardhome
# Clash插件
# git clone https://github.com/frainzy1477/luci-app-clash package/luci-app-clash

# Edge主题
git clone -b 18.06 https://github.com/garypang13/luci-theme-edge package/luci-theme-edge