#!/bin/bash
# ============= iStoreOS 24.10 仓库外的第三方插件==============
# ============= 若启用 则打开注释 ============================

# 分区扩容 by sirpdboy 
CUSTOM_PACKAGES="$CUSTOM_PACKAGES luci-app-partexp"
CUSTOM_PACKAGES="$CUSTOM_PACKAGES luci-i18n-partexp-zh-cn"
# 酷猫主题 by sirpdboy 
CUSTOM_PACKAGES="$CUSTOM_PACKAGES luci-theme-kucat"
# 进阶设置 by sirpdboy 
# 当luci-app-advancedplus插件开启时 需排除冲突项 luci-app-argon-config和luci-i18n-argon-config-zh-cn 减号代表排除
CUSTOM_PACKAGES="$CUSTOM_PACKAGES luci-app-advancedplus -luci-app-argon-config"
CUSTOM_PACKAGES="$CUSTOM_PACKAGES luci-i18n-advancedplus-zh-cn -luci-i18n-argon-config-zh-cn"
# OpenClash 代理（预置 mihomo + xray-core 内核，开箱可用）
CUSTOM_PACKAGES="$CUSTOM_PACKAGES luci-app-openclash mihomo xray-core"
# 网络测速 by sirpdboy 
#CUSTOM_PACKAGES="$CUSTOM_PACKAGES luci-app-netspeedtest"
#CUSTOM_PACKAGES="$CUSTOM_PACKAGES luci-i18n-netspeedtest-zh-cn"
# MosDNS
#CUSTOM_PACKAGES="$CUSTOM_PACKAGES luci-app-mosdns"
#CUSTOM_PACKAGES="$CUSTOM_PACKAGES luci-i18n-mosdns-zh-cn"
# 应用过滤 openappfilter.com
#CUSTOM_PACKAGES="$CUSTOM_PACKAGES luci-app-appfilter"
#CUSTOM_PACKAGES="$CUSTOM_PACKAGES luci-i18n-appfilter-zh-cn"
# 设置向导 by sirpdboy
#CUSTOM_PACKAGES="$CUSTOM_PACKAGES luci-app-netwizard"
#CUSTOM_PACKAGES="$CUSTOM_PACKAGES luci-i18n-netwizard-zh-cn"

# ============= 第三方插件的依赖补齐 =============================
# partexp 依赖 bc / f2fs-tools，这两项 iStoreOS manifest 未收录，
# 已把 ipk 放入 files/packages/custom/，需显式加进构建清单。
CUSTOM_PACKAGES="$CUSTOM_PACKAGES bc f2fs-tools f2fsck"
# partexp 依赖的其他工具 iStoreOS manifest 有，但默认未构建，需显式列出
CUSTOM_PACKAGES="$CUSTOM_PACKAGES parted btrfs-progs fdisk blkid losetup resize2fs e2fsprogs kmod-loop"
# kucat 主题声明依赖 wget，OpenWrt 里由 wget-ssl 提供虚拟包名 wget
CUSTOM_PACKAGES="$CUSTOM_PACKAGES wget-ssl"
# openclash 依赖 ruby 及 ruby-yaml；iStoreOS manifest 未收录，ipk 已放入 custom/
CUSTOM_PACKAGES="$CUSTOM_PACKAGES ruby ruby-yaml libruby3.3 ruby-pstore ruby-digest ruby-enc ruby-psych ruby-bigdecimal ruby-date ruby-stringio libyaml"
# openclash 依赖的内核模块与工具，iStoreOS manifest 有但默认未构建
CUSTOM_PACKAGES="$CUSTOM_PACKAGES kmod-tun unzip ip-full bash"

# ============= 若去除组件 则打开注释 ============================
# 若去掉istore商店 则打开注释
#CUSTOM_PACKAGES="$CUSTOM_PACKAGES -luci-app-store"
# 若去掉首页和网络向导 则打开注释
#CUSTOM_PACKAGES="$CUSTOM_PACKAGES -luci-i18n-quickstart-zh-cn"
