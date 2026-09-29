#!/bin/bash
# 全新 Ubuntu (GNOME) 字体安装脚本：MiSans(界面) + Maple Mono(等宽)
# 前提：fonts.conf 需从旧机器拷到当前目录（含字重修正 + 两个字体别名）
set -e

# 0. 前置依赖
sudo apt install -y wget unzip

# 1. 下载（-O 指定保存位置，否则落在当前目录）
wget -O ~/Downloads/MiSans.zip https://hyperos.mi.com/font-download/MiSans.zip
# Maple Mono 版本号固定在 v7.9，新版去 https://github.com/subframe7536/maple-font/releases 查
wget -O ~/Downloads/MapleMonoNL-NF-CN.zip \
  https://github.com/subframe7536/maple-font/releases/download/v7.9/MapleMonoNL-NF-CN.zip

# 2. 安装字体文件
mkdir -p ~/.local/share/fonts/MiSans ~/.local/share/fonts/MapleMono
unzip -j -o ~/Downloads/MiSans.zip "MiSans/ttf/*.ttf" -d ~/.local/share/fonts/MiSans/
unzip -j -o ~/Downloads/MapleMonoNL-NF-CN.zip "*.ttf" -d ~/.local/share/fonts/MapleMono/

# 3. 部署字体配置（字重修正 + sans-serif/monospace 别名）
#    先从旧机器拷过来，如：scp 旧机器:~/.config/fontconfig/fonts.conf ./fonts.conf
mkdir -p ~/.config/fontconfig
cp fonts.conf ~/.config/fontconfig/

# 4. 刷新缓存并验证
fc-cache -f
echo "== MiSans（若显示 Medium/Heavy，说明 fonts.conf 没生效）=="
fc-match "MiSans"        # 期望: MiSans-Regular.ttf
fc-match "MiSans:bold"   # 期望: MiSans-Bold.ttf
echo "== Maple Mono（monospace 泛型也应指向它）=="
fc-match "Maple Mono NL NF CN"        # 期望: MapleMonoNL-NF-CN-Regular.ttf
fc-match monospace                     # 期望: MapleMonoNL-NF-CN-Regular.ttf
fc-match monospace:bold                # 期望: MapleMonoNL-NF-CN-Bold.ttf

# 5. 设为 GNOME 默认字体
gsettings set org.gnome.desktop.interface font-name 'MiSans 11'
gsettings set org.gnome.desktop.interface document-font-name 'MiSans 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'Maple Mono NL NF CN 11'

echo "完成：界面/文档 = MiSans，终端/代码 = Maple Mono"
