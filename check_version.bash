#!/bin/bash

package_installed_version="$(cat "$HOME/.cache/home_package_version")"
package_latest_version="$(git ls-remote --tags "https://github.com/L0L022/config_iut" | sed "s|.*refs/tags/\(.*\)$|\1|g" | sort -V | tail -n 1)"

if [[ "$package_latest_version" && "$package_installed_version" != "$package_latest_version" ]]; then
  notify-send -i "system-software-update" "The Dark Side" "Version $package_latest_version disponible !!!\nVersion $package_installed_version installée."
fi
