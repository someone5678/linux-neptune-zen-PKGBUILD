
# For people who want to shoot theirselves in the foot

Kernel Source: [Custom zen-kernel source fork repo](https://github.com/someone5678/zen-kernel)

Resources:
* [linux-neptune-61](https://gitlab.com/evlaV/jupiter-PKGBUILD/-/tree/master/linux-neptune-61) pkg build configs from fork of [jupiter-PKGBUILD](https://gitlab.com/evlaV/jupiter-PKGBUILD)
* Fork of [linux-integration](https://gitlab.com/evlaV/linux-integration)
* [Zen Patched Kernel Sources](https://github.com/zen-kernel/zen-kernel/)
* ArchLinux's linux-zen pkg build configs from [svntogit-packages](https://github.com/archlinux/svntogit-packages/tree/packages/linux-zen/trunk)

## Build

Setup podman, docker, WSL, or whatever you prefer first.
[Steam Deck Tricks](https://gitlab.com/popsulfr/steam-deck-tricks) is also be helpful.

```bash
git clone https://github.com/someone5678/linux-neptune-zen-PKGBUILD
makepkg -s
```

## Install

After build and install packages, just like regular linux, run update-grub for correctly reflect kernel installation changes.

```bash
sudo update-grub
```

Also, to make fan control correctly work,
you need to change `fan_hwmon_name` in`/usr/share/jupiter-fan-control/jupiter-fan-control-config.yaml`. Ref: [linux-neptune-patches](https://github.com/pongo1231/linux-neptune-patches)

For example, in Linux 6.1.7, fan_hwmon_name is `steamdeck_hwmon`.
You can find it in file called `name` in `/sys/class/hwmon/hwmon4/`.

```bash
sudo sed -i 's/fan_hwmon_name: jupiter/fan_hwmon_name: steamdeck_hwmon/g' /usr/share/jupiter-fan-control/jupiter-fan-control-config.yaml
```

Then, simply shutdown and start your Steam Deck.
System set your custom kernel as default kernel.

You can check it by below command.

```bash
uname -r
```
