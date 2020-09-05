kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/python3-setuptools.bst
- components/docbook-xsl.bst
- components/libxslt.bst
- components/xmlto.bst
- components/asciidoc.bst

depends:
- components/lzo.bst
- components/zstd.bst
- components/e2fsprogs.bst
- bootstrap-import.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: kernel:linux/kernel/git/kdave/btrfs-progs.git
  track: master
  ref: v5.7-0-g11acf45eea6dd81e891564967051e2bb10bd25f7
