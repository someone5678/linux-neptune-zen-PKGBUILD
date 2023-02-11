# zen-patched linux-neptune based custom kernel 

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
cd linux-neptune-zen-PKGBUILD
makepkg -s
```

## (Un)Install

Before you proceed to (un)install, if you're using OverlayFS based projects (e.g. [rwfus](https://github.com/ValShaped/rwfus)),
you need to disable it first. Because kernel does not correctly (un)installed. After you (un)install the kernel you're good to enabled it back.

For rwfus:
```bash
# Before kernel (un)install
sudo rwfus --disable

# After kernel (un)install
sudo rwfus --enable
```

After (un)install packages, just like regular linux, run update-grub for correctly apply kernel (un)installation changes.

```bash
sudo update-grub
```

Also, to make fan control correctly work,
you need to change `fan_hwmon_name` in`/usr/share/jupiter-fan-control/jupiter-fan-control-config.yaml`. Ref: [linux-neptune-patches](https://github.com/pongo1231/linux-neptune-patches)

For example, in Linux 6.1.7, `fan_hwmon_name` is `steamdeck_hwmon`.
And current `fan_hwmon_name` is `jupiter`.
You can find it in file called `name` in `/sys/class/hwmon/hwmon4/`.

This might not needed in the future as jupiter-fan-control pkg updated to support both `fan_hwmon_name` (jupiter/steamdeck_hwmon).
For now, you need to manually set it.

```bash
# After kernel install
sudo sed -i 's/fan_hwmon_name: jupiter/fan_hwmon_name: steamdeck_hwmon/g' /usr/share/jupiter-fan-control/jupiter-fan-control-config.yaml

# After kernel uninstall
sudo sed -i 's/fan_hwmon_name: steamdeck_hwmon/fan_hwmon_name: jupiter/g' /usr/share/jupiter-fan-control/jupiter-fan-control-config.yaml
```

Then, simply shutdown and start your Steam Deck.

You can check current kernel by uname command or game session's settings page.

```bash
uname -r
```
