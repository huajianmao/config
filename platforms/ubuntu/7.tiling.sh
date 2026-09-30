echo "Install Tiling Shell: https://extensions.gnome.org/extension/7065/tiling-shell/"

# ===== Tiling Shell 快捷键绑定（dconf 写入，即时生效）=====
# Super+← / → ：窗口移到左/右侧磁贴
dconf write /org/gnome/shell/extensions/tilingshell/move-window-left "['<Super>Left']"
dconf write /org/gnome/shell/extensions/tilingshell/move-window-right "['<Super>Right']"
# Super+↑ ：窗口横跨所有磁贴（≈最大化）
dconf write /org/gnome/shell/extensions/tilingshell/span-window-all-tiles "['<Super>Up']"
# Super+↓ ：取消平铺并恢复原始大小（≈取消最大化）
dconf write /org/gnome/shell/extensions/tilingshell/untile-window "['<Super>Down']"

# ===== 禁用抢键的 Ubuntu Tiling Assistant =====
gnome-extensions disable tiling-assistant@ubuntu.com
# 若需开回来：
# gnome-extensions enable tiling-assistant@ubuntu.com

# ===== 系统原生绑定保持为空（Tiling Shell 开机时会自动清空，
#       一般不用手动执行；如果哪天它们又抢键，跑下面四条即可）=====
gsettings set org.gnome.mutter.keybindings toggle-tiled-left "[]"
gsettings set org.gnome.mutter.keybindings toggle-tiled-right "[]"
gsettings set org.gnome.desktop.wm.keybindings maximize "[]"
gsettings set org.gnome.desktop.wm.keybindings unmaximize "[]"
