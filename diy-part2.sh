#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# 修改默认IP
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate

# 修改主机名
sed -i 's/OpenWrt/Phicomm-K1/g' package/base-files/files/bin/config_generate

# 修改wifi名字
sed -i "s/OpenWrt/abbw_k1/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改wifi密码
sed -i "s/encryption=none/encryption=psk2\n			set wireless.default_radio\$\{devidx\}.key=147258369/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改版本号
sed -i "s/OpenWrt /@笨蛋海绵 编译 OpenWrt 于 $(TZ=UTC-8 date "+%Y.%m.%d")/g" package/lean/default-settings/files/zzz-default-settings

# 修改时区
sed -i "s/'UTC'/'CST-8'\n   set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

# 删除默认主题
#sed -i '/\+luci-theme-bootstrap/d' feeds/luci/collections/luci/Makefile
#sed -i '/\+luci-theme-bootstrap/d' package/feeds/luci/luci/Makefile
#sed -i '/CONFIG_PACKAGE_luci-theme-bootstrap=y/d' .config
#sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# 修改默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-edge/g' feeds/luci/collections/luci/Makefile

# 添加内核编译用户
[ -z $(grep "CONFIG_KERNEL_BUILD_USER=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_USER="abbw"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_USER=\).*@\1$"abbw"@' .config

# 添加内核编译域名
[ -z $(grep "CONFIG_KERNEL_BUILD_DOMAIN=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_DOMAIN="GitHub Actions"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_DOMAIN=\).*@\1$"GitHub Actions"@' .config