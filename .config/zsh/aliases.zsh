# general aliases
alias ll="ls -l"
alias grep="grep -n --color"
alias r="source ~/.config/zsh/.zshrc"

# jekyll aliases
alias jrun="bundle exec jekyll serve"
alias jrund="bundle exec jekyll serve --drafts"

# gnome backup aliases
alias backup-settings="dconf dump / > $HOME/.config/gnome/dconf-backup"
alias restore-settings="cat $HOME/.config/gnome/dconf-backup | dconf load /"

# git aliases
alias config='lazygit --use-config-file "$HOME/.config/yadm/lazygit.yml,$HOME/.config/lazygit/config.yml" --work-tree ~ --git-dir ~/.local/share/yadm/repo.git'
alias lg='lazygit'
alias gl='git log --oneline'

# docker aliases
alias dc='docker-compose'
alias docker-up-prod='docker compose -f prod.yml up --build'
alias docker-up-dev='docker compose -f dev.yml up --build'
alias docker-down-prod='docker compose -f prod.yml down'
alias docker-down-dev='docker compose -f dev.yml down'
alias docker-clean='docker rm -vf $(docker ps -aq) && docker rmi -f $(docker images -aq) && docker images'

# serial devices
alias xbee1="picocom --echo /dev/serial/by-id/usb-FTDI_FT232R_USB_UART_AL033E2Q-if00-port0 --omap crcrlf"
alias xbee2="picocom --echo /dev/serial/by-id/usb-FTDI_FT232R_USB_UART_A105TFE1-if00-port0 --omap crcrlf"
alias xbee3="picocom --echo /dev/serial/by-id/usb-FTDI_FT232R_USB_UART_AL033E26-if00-port0 --omap crcrlf"
alias arduino="picocom --echo /dev/serial/by-id/usb-Arduino__www.arduino.cc__0043_75735323230351516152-if00 --omap crcrlf -b 115200"
alias feather-tft="picocom --echo /dev/serial/by-id/usb-Adafruit_Feather_ESP32-S2_TFT_84:f7:03:f5:a5:52-if00 --omap crcrlf -b 115200"

# custom functions used as aliases
system-install() {
	if [ $# -lt 2 ]; then
		TAGS="all"
	else
		TAGS="$2"
	fi

	ANSIBLE_DIR="$HOME/Projects/system-installer/"
	ANSIBLE_CONFIG=$ANSIBLE_DIR ansible-playbook -i $ANSIBLE_DIR/hosts.yml $ANSIBLE_DIR/system-install.yml --tags "$TAGS" --limit $1
}

pio-new-project() {
	declare -a BOARDS=(
		"adafruit_feather_esp32s2_tft"
		"uno"
	)

	BOARD=$(print -l $BOARDS | fzf)
	pio project init --ide vim --board $BOARD

	echo "Delete first two lines of .ccls to prevent error with ccls.."
	sed -i '1,2d' .ccls

}
