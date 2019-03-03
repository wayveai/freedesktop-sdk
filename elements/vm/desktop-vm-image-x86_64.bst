kind: x86image
description: Create a deployment of the desktop image
depends:
- filename: vm/desktop-vm.bst
  type: build
- filename: vm/deploy-tools.bst
  type: build

variables:
  # Size of the disk to create
  #
  # Should be able to calculate this based on the space
  # used, however it must be a multiple of (63 * 512) bytes
  # as mtools wants a size that is devisable by sectors (512 bytes)
  # per track (63).
  #
  # This is the smallest boot partition I managed to make.
  boot-size: 38912K

  rootfs-size: 6G
  sector-size: 512

  kernel-args: root=/dev/sda2 rootfstype=ext4 init=/usr/lib/systemd/systemd console=ttyS0

config:
  base: vm/deploy-tools.bst
  input: vm/desktop-vm.bst

  filesystem-tree-setup-commands:
    (<):
    - mkdir -p %{build-root}/dev
    - mkdir -p %{build-root}/proc
    (>):
    - systemd-firstboot --root %{build-root} --root-password root --locale en_US.UTF-8
      --timezone UTC
    # systemd-firstboot generates /etc/shadow with no permission,
    # so generating the image fails
    - chmod 400 %{build-root}/etc/shadow

  final-commands:
    (>):
    - |
      cat > %{install-root}/run-in-qemu.sh << EOF
      #!/bin/sh
      qemu-system-x86_64 -drive file=sda.img,format=raw -enable-kvm -m 2g -vga virtio -display sdl,gl=on
      EOF
      chmod +x %{install-root}/run-in-qemu.sh
