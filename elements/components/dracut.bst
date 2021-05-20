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
  ref: 054-0-g53337dfdc3ef58e257330d506fbe1a6044ea838a
- kind: patch
  path: patches/dracut/dracut-riscv64-efi.patch
