# Please refer to: https://lixx.cn/posts/tech/fcitx5-input-method-setup-on-ubuntu-26-04/

sudo apt install fcitx5 fcitx5-rime fcitx5-chinese-addons

sudo tee /etc/environment <<EOF
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
XMODIFIERS=@im=fcitx
QT_IM_MODULE=fcitx
QT_IM_MODULES=wayland;fcitx
EOF

mkdir -p ~/.config/gtk-3.0
mkdir -p ~/.config/gtk-4.0

tee ~/.config/gtk-3.0/settings.ini << 'EOF'
[Settings]
gtk-im-module=fcitx
EOF

tee ~/.config/gtk-4.0/settings.ini << 'EOF'
[Settings]
gtk-im-module=fcitx
EOF

gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gtk/IMModule':<'fcitx'>}"

mkdir -p ~/.config/autostart
cat > ~/.config/autostart/fcitx5.desktop << 'EOF'
[Desktop Entry]
Type=Application
Name=Fcitx5
Exec=fcitx5
Comment=Start Fcitx5 input method
EOF

rm  -rf ~/.local/share/fcitx5/rime
git clone --depth=1 https://github.com/iDvel/rime-ice.git ~/.local/share/fcitx5/rime
