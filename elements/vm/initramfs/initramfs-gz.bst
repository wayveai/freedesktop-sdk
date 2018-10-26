kind: script

description: |
  The compressed initramfs.

  For documentation on initramfs in general, see:
  https://www.kernel.org/doc/Documentation/filesystems/ramfs-rootfs-initramfs.txt

depends:
- filename: bootstrap-import.bst
  type: build
- filename: base/cpio.bst
  type: build
- filename: base/gzip.bst
  type: build
- filename: vm/initramfs/initramfs.bst
  type: build

variables:
  cwd: '%{build-root}'

config:
  layout:
  - element: bootstrap-import.bst
    destination: /
  - element: base/cpio.bst
    destination: /
  - element: base/gzip.bst
    destination: /
  - element: vm/initramfs/initramfs.bst
    destination: '%{build-root}'

  commands:
  # We need to ensure exec permissions here.
  # See: https://gitlab.com/BuildStream/buildstream/issues/84
  - chmod +x ./init ./shutdown

  - mkdir -p ./dev
  - mkdir -p ./proc

  - mkdir -p %{install-root}/boot
  - (find . -print0 | cpio -0 -H newc -o) | gzip -c > %{install-root}/boot/initramfs.gz
