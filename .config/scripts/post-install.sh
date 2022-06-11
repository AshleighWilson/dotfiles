#!/bin/sh

# exit if any command fails
set -e

SOFTWARE=(
	nextcloud-client
	brave-bin
	chrome-gnome-shell
	keepassxc
	nfs-utils
	nerd-fonts-roboto-mono
	zsh
	zinit-git
	zsh-pure-prompt-git
	phinger-cursors
	tela-icon-theme
	qt5-wayland
	nextcloud-client-cloudproviders
	python-nautilus
	bluez-utils
	bat
	gdm-settings
	yadm
	lua-language-server
	bash-language-server
	transmission-gtk
	evolution
	pacman-contrib
	fuse2 # fuse 2 for AppImage
	neovim
)

XPS_SOFTWARE=(
	sof-firmware
)

FRACTAL_SOFTWARE=(
)

SOFTWARE_GNOME=(
	evince
	file-roller
	gdm
	gnome-calculator
	gnome-control-center 
	gnome-disk-utility
	gnome-keyring
	gnome-remote-desktop 
	gnome-session 
	gnome-settings-daemon 
	gnome-shell 
	gnome-shell-extensions 
	gnome-software 
	gnome-system-monitor
	gnome-terminal
	gvfs
	gvfs-nfs
	gvfs-smb
	mutter
	nautilus
	sushi
	tracker3-miners
	xdg-user-dirs-gtk
	gnome-tweaks
)

# config variables
FILENAME=${0##*/}                                                           
FILEPATH=${0}                                                               
DEVICE="XPS"

# TODO install yadm and clone repo

# start network
sudo systemctl enable --now NetworkManager.service
# TODO connect to network

# enable hidpi for systemd-boot
sudo sed -i 's/^#console-mode.*/console-mode auto/' /boot/loader/loader.conf
# TODO ??? sudo bootctl update

# configure pacman
sudo sed -i 's/^#Color/Color/' /etc/pacman.conf
sudo sed -i 's/^#ParallelDownloads.*/ParallelDownloads = 10/' /etc/pacman.conf

# install paru for AUR
if ! command -v paru &>/dev/null; then
	sudo pacman -S --needed --noconfirm base-devel git
	git clone https://aur.archlinux.org/paru.git
	cd paru
	makepkg -si --noconfirm
	cd ..
	rm -rf paru
fi

# install software
paru -S --needed --noconfirm ${SOFTWARE_GNOME[@] ${SOFTWARE[@]}

cp $HOME/.config/wallpapers/fox-forest.jpg $HOME/.local/share/backgrounds/2022-06-10-19-33-29-fox-forest.jpg
mkdir -p $HOME/.config/dconf/
cp $HOME/.config/gnome/dconf-backup $HOME/.config/dconf/user

# enable services
sudo systemctl enable gdm.service

echo "Reboot now."

# sudo sed -i 's/^#DiscoverableTimeout.*/DiscoverableTimeout = 0/' /etc/bluetooth/main.conf
# sudo sed -i 's/^#AlwaysPairable.*/AlwaysPairable = true/' /etc/bluetooth/main.conf
# sudo sed -i 's/^#AutoEnable.*/AutoEnable = true/' /etc/bluetooth/main.conf

# sudo systemctl enable --now bluetooth.service

# fstab
# NAS nfs share
#server.lan:/mnt/data		/media/data	nfs	noauto,user,_netdev,bg  0 0
#sudo mkdir -p /media/data/
#echo -e '# NAS nfs share\nserver.lan:/mnt/data              /media/data     nfs     noauto,user,_netdev,bg  0 0' | sudo tee -a /etc/fstab > /dev/null


# GDM fractional scaling
#sudo machinectl shell gdm@ /bin/bash
#gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

#echo "zram-size = min(min(ram, 4096) + max(ram - 4096, 0), 32 * 1024)" >> /etc/systemd/zram-generator.conf

# enable hibernation https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate#Hibernation
# create a swap partition or file.
# add "default linux-lts.conf" or similar to /boot/loader/loader.conf
# lsblk -f for UUID
# add "resume=UUID=ENTER_UID" to /boot/loader/entries/linux-lts.conf
# add "resume" hook to /etc/mkinitcpio.conf. must be after udev hook.
# mkinitcpio -p linux-lts (or possibly mkinitcpio -P) to regenerate the ramdisk.
# change power button behaviour in gnome settings to hibenate.
