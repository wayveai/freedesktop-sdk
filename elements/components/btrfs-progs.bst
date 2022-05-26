kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/asciidoc.bst
- components/docbook-xsl.bst
- components/libxslt.bst
- components/python3-setuptools.bst
- components/python3-sphinx.bst
- components/xmlto.bst

depends:
- bootstrap-import.bst
- components/e2fsprogs.bst
- components/lzo.bst
- components/systemd-libs.bst
- components/zstd.bst

variables:
  # Makefile not generated inside buil-dir
  build-dir: ''

sources:
- kind: git_tag
  url: kernel:linux/kernel/git/kdave/btrfs-progs.git
  track: master
  ref: v5.18-0-gf9e303584272b81b05b926a0cc9010f43af12a03
