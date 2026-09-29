
echo "NOTICE: Install a browser first!"

sudo snap remove --purge $(snap list | awk 'NR>1 && $1!="snapd" {print $1}')
sudo snap remove --purge snapd

sudo systemctl stop snapd.service snapd.socket snapd.seeded.service
sudo systemctl mask snapd

sudo apt purge -y snapd snap-confine gnome-software-plugin-snap
sudo apt autoremove --purge -y
# 删除所有Snap系统/用户目录
sudo rm -rf /snap /var/snap /var/lib/snapd /var/cache/snapd
rm -rf ~/snap ~/.snap

sudo tee /etc/apt/preferences.d/nosnap.pref <<EOF
Package: snapd* gnome-software-plugin-snap
Pin: release a=*
Pin-Priority: -10
EOF
sudo apt update

sudo apt install --install-suggests gnome-software gdebi
