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
  ref: 053-0-gc67b62463762de1b79c62c9077d4a3ba96a94aa1
- kind: patch
  path: patches/dracut/dracut-riscv64-efi.patch
