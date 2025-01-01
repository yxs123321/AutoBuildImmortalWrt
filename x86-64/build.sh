#!/bin/bash

echo "编译固件大小为: $PROFILE MB"

# 输出调试信息
echo "$(date '+%Y-%m-%d %H:%M:%S') - 开始编译..."



# 定义所需安装的包列表
套餐=""
套餐="$套餐 curl"
套餐="$套餐 luci-i18n-diskman-zh-cn"
套餐="$套餐 luci-i18n-firewall-zh-cn"
套餐="$套餐 luci-i18n-filebrowser-zh-cn"
套餐="$套餐 luci-app-argon-config"
套餐="$套餐 luci-i18n-argon-config-zh-cn"
套餐="$套餐 luci-i18n-opkg-zh-cn"
套餐="$套餐 luci-i18n-ttyd-zh-cn"
套餐="$套餐 luci-i18n-passwall-zh-cn"
套餐="$套餐 luci-app-openclash"
套餐="$套餐 luci-i18n-homeproxy-zh-cn"
套餐="$套餐 openssh-sftp-server"
套餐="$套餐 luci-i18n-dockerman-zh-cn"
套餐="$套餐 hysteria"

# 构建镜像
echo "$(date '+%Y-%m-%d %H:%M:%S') - Building image with the following packages:"
echo "$套餐"

make image 轮廓="generic" 套餐="$套餐" 文件="/home/build/immortalwrt/files" ROOTFS_PARTSIZE=$轮廓

如果 [ $? -讷 0 ]; 然后
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Error: Build failed!"
    出口 1
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') - Build completed successfully."
