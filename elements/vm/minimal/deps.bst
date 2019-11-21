kind: stack

runtime-depends:
- bootstrap-import.bst
- components/util-linux.bst
- vm/bsp-generic/linux.bst
- components/systemd.bst
- components/dbus.bst
- components/dracut.bst
- components/os-release.bst
- vm/linux-vm-boot/shadow.bst
- components/tzdata.bst
- vm/base-filesystem.bst
- vm/config/journald.bst
- vm/config/networkd.bst
- vm/config/resolved.bst
