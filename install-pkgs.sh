#!/usr/bin/sh -x

sudo steamos-readonly disable

wget --content-disposition https://archlinux.org/packages/extra/x86_64/pahole/download/

sudo rwfus --disable
sudo pacman -U *.zst --noconfirm
rm pahole*.pkg.tar.zst

sudo update-grub

sudo sed -i 's/fan_hwmon_name: jupiter/fan_hwmon_name: steamdeck_hwmon/g' /usr/share/jupiter-fan-control/jupiter-fan-control-config.yaml

sudo rwfus --enable
