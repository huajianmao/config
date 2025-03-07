#!/usr/bin/env bash

echo "正在设置主机名..."

# 检查是否提供了主机名参数，如果没有则使用默认值
HOSTNAME=${1:-mini}

# 更改系统的各种主机名设置
if sudo scutil --set HostName "$HOSTNAME" &&
   sudo scutil --set LocalHostName "$HOSTNAME" &&
   sudo scutil --set ComputerName "$HOSTNAME" &&
   sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$HOSTNAME"; then
    echo "✅ 主机名已成功设置为: $HOSTNAME"
else
    echo "❌ 设置主机名时发生错误"
    exit 1
fi

# 显示新的主机名设置
echo "当前主机名设置："
echo "HostName: $(scutil --get HostName)"
echo "LocalHostName: $(scutil --get LocalHostName)"
echo "ComputerName: $(scutil --get ComputerName)"