kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/pkg-config.bst
  type: build
- filename: components/kmod.bst
- filename: components/asciidoc.bst
  type: build
- filename: components/cpio.bst
  type: runtime
- filename: components/libxslt.bst
  type: build
- filename: components/docbook-xsl.bst
  type: build
- filename: components/e2fsprogs.bst

variables:
  builddir: ''
  lib: 'lib'

sources:
- kind: git_tag
  url: kernel:boot/dracut/dracut.git
  track: master
  ref: 055-0-g86bf2533d77762e823ad7a3e06a574522c1a90e3
- kind: patch
  path: patches/dracut/dracut-riscv64-efi.patch
