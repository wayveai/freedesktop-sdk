kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/asciidoc.bst
  type: build
- filename: components/groff.bst
  type: build
- filename: components/xmlto.bst
  type: build
- filename: components/docbook-xml.bst
  type: build
- filename: components/docbook-xsl.bst
  type: build
- filename: components/libxslt.bst
  type: build

variables:
  build-dir: ''

config:
  build-commands:
    (>):
    - make manpages

sources:
- kind: git_tag
  url: repo_or_cz:nasm.git
  track: master
  exclude:
  - nasm-*rc*
  ref: nasm-2.15.01-0-gf0dc62c6a680a3cad5baa39a05c88716fb181806
- kind: patch
  path: patches/nasm/nasm-disable-werror-attributes.patch
