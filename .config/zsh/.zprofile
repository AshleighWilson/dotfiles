if [[ `hostnamectl --static` == "xps" ]]; then
	# Do device specific stuff.
fi

export QT_QPA_PLATFORM=wayland
