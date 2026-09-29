echo "Install Input Method Panel: https://extensions.gnome.org/extension/261/kimpanel/"
echo "Install User Themes: https://extensions.gnome.org/extension/19/user-themes/"
echo "Install Dash to Dock: https://extensions.gnome.org/extension/307/dash-to-dock/"
echo "Install Blur my shell: https://extensions.gnome.org/extension/3193/blur-my-shell/"
echo "NOTICE: Disable Ubuntu Dock Please!"

git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git --depth=1
git clone https://github.com/vinceliuice/WhiteSur-cursors.git --depth=1


# install theme
./install -l
./install -t blue
./install -N mojave
sudo ./tweaks.sh -g -b default

# install icons
./install.sh -b

