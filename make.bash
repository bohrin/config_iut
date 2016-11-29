#!/bin/bash

mkdir work
cd work || exit
mkdir home_copy

function install_arc_theme {
	git clone https://github.com/horst3180/arc-theme --depth 1
	cd arc-theme || exit
	mkdir install
	bash ./autogen.sh --prefix="$(realpath ./install)"
	make install
	mkdir ../home_copy/.themes
	mv install/share/themes/* ../home_copy/.themes/
	cd ..
}

function install_theme {
	install_arc_theme
}

function install_faba_icon_theme {
	git clone https://github.com/snwh/faba-icon-theme.git
	cd faba-icon-theme || exit
	mkdir install
	bash ./autogen.sh --prefix="$(realpath ./install)"
	make
	make install DESTDIR="$(realpath ./install)"
	mkdir ../home_copy/.icons
	mv install/usr/share/icons/* ../home_copy/.icons/
	cd ..
}

function install_faba_mono_icon_theme {
	git clone https://github.com/snwh/faba-mono-icons.git
	cd faba-mono-icons || exit
	mkdir install
	bash ./autogen.sh --prefix="$(realpath ./install)"
	make
	make install
	mkdir ../home_copy/.icons
	mv install/share/icons/* ../home_copy/.icons/
	cd ..
}


function install_moka_icon_theme {
	git clone https://github.com/moka-project/moka-icon-theme.git
	cd moka-icon-theme || exit
	mkdir install
	bash ./autogen.sh --prefix="$(realpath ./install)"
	make
	make install DESTDIR="$(realpath ./install)"
	mkdir ../home_copy/.icons
	mv install/usr/share/icons/* ../home_copy/.icons/
	cd ..
}

function install_arc_icon_theme {
	git clone https://github.com/horst3180/arc-icon-theme --depth 1
	cd arc-icon-theme || exit
	mkdir install
	bash ./autogen.sh --prefix="$(realpath ./install)"
	make install
	mkdir ../home_copy/.icons
	mv install/share/icons/* ../home_copy/.icons/
	cd ..
}

function install_icon_theme {
	install_faba_icon_theme
	install_faba_mono_icon_theme
	install_moka_icon_theme
	install_arc_icon_theme
}

function install_atom {
	atom_version="1.12.1"
	mkdir -p home_copy/.cache/atom
	wget -c "https://github.com/atom/atom/releases/download/v$atom_version/atom-amd64.tar.gz"
	tar -zvxf "atom-amd64.tar.gz"
	mv atom-"$atom_version-amd64"/* home_copy/.cache/atom

	echo "[Desktop Entry]
Encoding=UTF-8
Name=Atom
Exec=~/.cache/atom/atom
Icon=~/.cache/atom/atom.png
Terminal=false
StartupNotify=true
Type=Application" > "home_copy/.cache/atom/atom.desktop"
	chmod u+x "home_copy/.cache/atom/atom.desktop"
}

function install_atom_extentions {
	mkdir -p home_copy/.atom/
	ATOM_HOME="$(realpath home_copy/.atom/)"
	export ATOM_HOME
	home_copy/.cache/atom/resources/app/apm/bin/apm install --packages-file ../atom-extentions.txt

	#data-atom config file
	cp ../data-atom-connections.cson home_copy/.atom/
}

function install_shellcheck {
	mkdir -p home_copy/bin
	shellcheck_version="0.4.4-4"
	wget http://ftp.fr.debian.org/debian/pool/main/s/shellcheck/shellcheck_"$shellcheck_version"_amd64.deb
	dpkg -x shellcheck_"$shellcheck_version"_amd64.deb install
	mv install/usr/bin/shellcheck home_copy/bin/
}

function install_software {
	install_atom
	install_atom_extentions
	install_shellcheck
}

install_theme
install_icon_theme
install_software
install_atom_extentions

cp ../main.bash home_copy/.cache/
tar -cJf home_package.tar.xz -C home_copy .
mv home_package.tar.xz ../
