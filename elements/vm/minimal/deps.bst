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
- components/iproute2.bst
- vm/base-filesystem.bst
- vm/config/journald.bst
- vm/config/networkd.bst
- vm/config/resolved.bst
- vm/config/useradd-default.bst
- components/usbutils.bst
- components/hosts.bst
- components/bash-config.bst
- components/bash-completion.bst
