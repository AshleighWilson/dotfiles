#!/bin/sh

DEVICE="SERVER"

INSTALL_CMD="paru -S --noconfirm --needed"


CORE=(
	bash-language-server
	neovim
	zsh
	zinit-git
	zsh-pure-prompt-git
	openssh
	wget
)

SERVER=(

	# virt machines
	libvirt
	# iptables-nft
	edk2-ovmf
	qemu-base
	gnu-netcat
	dnsmasq
)

echo "Enabling untracked files in yadm.. "
# show untracked config files
yadm gitconfig --unset status.showUntrackedFiles

# exit if any command fails
set -e

echo "Starting network.. "
sudo systemctl enable --now NetworkManager.service
# TODO connect to network

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

$INSTALL_CMD ${CORE[@]}
sudo chsh -s /usr/bin/zsh $USER
rm -rf $HOME/.bash*

if [ "$DEVICE" == "SERVER" ]; then
	echo "Installing server software.. "
	$INSTALL_CMD ${SERVER[@]}

	sudo systemctl enable --now sshd
	#disable password auth

	sudo usermod -aG libvirt ashleigh
	sudo systemctl enable --now libvirtd
else
	echo not server
fi
exit 0


# enable hidpi for systemd-boot
sudo sed -i 's/^#console-mode.*/console-mode max/' /boot/loader/loader.conf
# TODO ??? sudo bootctl update

# install software
paru -S --needed --noconfirm ${SOFTWARE_GNOME[@]} ${SOFTWARE[@]}

exit 0

SOFTWARE=(
	nextcloud-client
	brave-bin
	chrome-gnome-shell
	keepassxc
	nfs-utils
	nerd-fonts-roboto-mono
	zsh
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
	ccls
	ripgrep-all
	lazygit
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
	adw-gtk3-git
	totem
	gst-libav # gstreamer codecs (totem)
	picocom
	polari # irc client
	gparted
)

SOFTWARE_ELECTRONICS=(
	fritzing
	platformio
	platformio-udev-rules
)

if [ "$1" == "install" ]; then
	if [ "$2" == "electronics" ]; then
		function install_electronics {
			echo "Installing electronics software.."
			$INSTALL_CMD ${SOFTWARE_ELECTRONICS[@]}
			sudo usermod -aG uucp $USER
			sudo usermod -aG lock $USER
		}
		install_electronics
	fi
	exit
fi

# config variables
FILENAME=${0##*/}                                                           
FILEPATH=${0}                                                               


mkdir $HOME/.local/share/backgrounds/
cp $HOME/.config/wallpapers/fox-forest.jpg $HOME/.local/share/backgrounds/2022-06-10-19-33-29-fox-forest.jpg

dconf load / < $HOME/.config/gnome/dconf-backup

# enable services
sudo systemctl enable gdm.service

echo "Reboot now."

# TODO Setup nextcloud
# TODO KeePassXC keyfile and sshkeys
# TODO Steam and correct vulkan libs, Steam proton

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
