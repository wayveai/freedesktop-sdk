kind: stack

depends:
- bootstrap-import.bst
- components/util-linux-full.bst
- components/linux.bst
- components/linux-firmware.bst
- components/wireless-regdb-bin.bst
- components/systemd.bst
- components/dbus.bst
- components/dracut.bst
- components/os-release.bst
- components/shadow.bst
- components/tzdata.bst
- vm/base-filesystem.bst
- vm/mesa-default.bst
- components/weston.bst
- components/xwayland.bst
- components/plymouth.bst
- platform.bst
- components/nsswitch-config-bootable.bst
- components/linux-pam.bst
- components/sudo.bst
- components/flatpak.bst
- components/xdg-desktop-portal.bst
- vm/config/flathub.bst
- vm/config/pipewire.bst
- vm/config/weston.bst
- vm/config/sudo.bst
- vm/config/networkd.bst
- vm/config/resolved.bst
- vm/config/journald.bst
- vm/config/useradd-default.bst
- components/wpa-supplicant.bst
- components/steam-devices.bst
- components/pinentry-ncurses.bst
- components/pcsc-lite.bst
- components/ccid.bst
- components/openssh-systemd.bst
- components/iproute2.bst
- components/gamemode.bst
- components/open-iscsi.bst
- components/usbutils.bst
- components/cups-daemon.bst
- components/gnupg-systemd.bst
- components/polkit.bst
- components/dmidecode.bst
- components/fwupd.bst
- components/udisks.bst
- components/iio-sensor-proxy.bst
- components/hosts.bst
- components/iptables.bst
- components/podman.bst
- components/f2fs-tools.bst
- components/btrfs-progs.bst
- components/fscrypt-maybe.bst
- components/bash-config.bst
- components/bash-completion.bst
- components/apparmor.bst
- components/tpm2-tools.bst
- components/tpm2-pkcs11.bst
