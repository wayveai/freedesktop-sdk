kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/python3-setuptools.bst
- components/docbook-xsl.bst
- components/libxslt.bst
- components/xmlto.bst
- components/asciidoc.bst

depends:
- components/e2fsprogs.bst
- components/lzo.bst
- components/systemd-libs.bst
- components/zstd.bst
- bootstrap-import.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: kernel:linux/kernel/git/kdave/btrfs-progs.git
  track: master
  ref: v5.16.2-0-g31458c9c81935abbed010221261897273a98d2c1
