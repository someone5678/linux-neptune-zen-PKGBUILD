
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

## Usage

After build and install packages, just like regular linux, run update-grub for correctly reflect kernel installation changes.

```bash
sudo update-grub
```

Then, shutdown your Steam Deck, enter grub menu by pressing ... button and power button.
Go to Advanced menu, select your kernel.
Once turn on, you can simply just shut down your device.
Now system set your custom kernel as default.
