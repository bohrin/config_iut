#!/bin/bash

mkdir work
cd work || exit
mkdir home_copy

function get_source {
	user_depo="$1"
	depo="$(basename "$user_depo")"
	github_url="https://github.com/$user_depo"
	last_release="$(git ls-remote --tags "$github_url" | sed "s|.*refs/tags/\(.*\)$|\1|g" | grep -v "beta" | grep -v "alpha" | sort -V | tail -n 1)"
	if [ -z "$last_release" ]; then
		last_release="master"
	fi
	echo "last_release=$last_release"
	wget -O "$depo.tar.gz" "$github_url/archive/$last_release.tar.gz"
	mkdir "$depo"
	tar xzf "$depo.tar.gz" -C "$depo" --strip-components=1
}

function install_arc_theme {
	#git clone https://github.com/horst3180/arc-theme --depth 1
	get_source "horst3180/arc-theme"
	cd arc-theme || exit
	mkdir install
	bash ./autogen.sh --with-gnome=3.14 --prefix="$(realpath ./install)"
	make install
	mkdir ../home_copy/.themes
	mv install/share/themes/* ../home_copy/.themes/
	cd ..
}

function install_theme {
	install_arc_theme
}

function install_faba_icon_theme {
	#git clone https://github.com/snwh/faba-icon-theme.git
	get_source "snwh/faba-icon-theme"
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
	#git clone https://github.com/snwh/faba-mono-icons.git
	get_source "snwh/faba-mono-icons"
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
	#git clone https://github.com/moka-project/moka-icon-theme.git
	get_source "moka-project/moka-icon-theme"
	cd moka-icon-theme || exit
	mkdir install
	bash ./autogen.sh --prefix="$(realpath ./install)"
	make
	make install DESTDIR="$(realpath ./install)"
	rm -R install/usr/share/icons/Moka/{*@2x,256x256}
	mkdir ../home_copy/.icons
	mv install/usr/share/icons/* ../home_copy/.icons/
	cd ..
}

function install_arc_icon_theme {
	#git clone https://github.com/horst3180/arc-icon-theme --depth 1
	get_source "horst3180/arc-icon-theme"
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
	atom_version="$(git ls-remote --tags "https://github.com/atom/atom/" | sed "s|.*refs/tags/\(.*\)$|\1|g" | grep -v "beta" | sort -V | tail -n 1)"
	mkdir -p home_copy/.cache/atom
	wget "https://github.com/atom/atom/releases/download/$atom_version/atom-amd64.tar.gz"
	tar -zxf "atom-amd64.tar.gz"
	mv atom-*/* home_copy/.cache/atom

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

function install_atom_packages {
	mkdir -p home_copy/.atom/
	ATOM_HOME="$(realpath home_copy/.atom/)"
	export ATOM_HOME
	home_copy/.cache/atom/resources/app/apm/bin/apm install --packages-file ../atom-packages.txt

	#config files
	cp ../config.cson ../data-atom-connections.cson home_copy/.atom/
}

function install_shellcheck {
	mkdir shellcheck
	cd shellcheck || exit
	shellcheck_version="0.4.4-4"
	wget http://ftp.fr.debian.org/debian/pool/main/s/shellcheck/shellcheck_"$shellcheck_version"_amd64.deb
	ar x shellcheck_"$shellcheck_version"_amd64.deb
	tar -xf data.tar.xz
	mkdir -p ../home_copy/bin
	mv usr/bin/shellcheck ../home_copy/bin/
	cd ..
}

function install_software {
	install_atom
	install_atom_packages
	install_shellcheck
}

install_theme
install_icon_theme
install_software

cp ../main.bash home_copy/.cache/
tar -cJf home_package.tar.xz -C home_copy .
mv home_package.tar.xz ../
