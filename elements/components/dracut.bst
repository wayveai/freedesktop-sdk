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
  ref: 049-0-g225e4b94cbdb702cf512490dcd2ad9ca5f5b22c1
