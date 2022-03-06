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
  build-dir: ''
  lib: 'lib'

sources:
- kind: git_tag
  url: kernel:boot/dracut/dracut.git
  track: master
  ref: 056-0-g631d5f72a223288aa1f48bb8e8d0313e75947400
- kind: patch
  path: patches/dracut/dracut-riscv64-efi.patch
