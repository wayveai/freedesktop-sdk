kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/asciidoc.bst
- components/groff.bst
- components/xmlto.bst
- components/docbook-xml.bst
- components/docbook-xsl.bst
- components/libxslt.bst

variables:
  # Build script generates sources and if build-dir is used
  # it tries to generate them in directories that do not
  # exist
  build-dir: ''

depends:
- bootstrap-import.bst

config:
  build-commands:
    (>):
    - make manpages

sources:
- kind: git_tag
  url: github:netwide-assembler/nasm.git
  track: master
  track-extra:
  - nasm-2.15.xx
  exclude:
  - nasm-*rc*
  ref: nasm-2.15.05-0-g214f2d4c56925a280c480950bbf71389e2169e1a
- kind: patch
  path: patches/nasm/nasm-disable-werror-attributes.patch
