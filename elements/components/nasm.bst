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
  builddir: ''

config:
  build-commands:
    (>):
    - make manpages

sources:
- kind: git_tag
  url: https://repo.or.cz/nasm.git
  track: master
  ref:  nasm-2.14.02-0-ga73b8be6f0f9e307e3c6131011a30f2fd5b00877
- kind: patch
  path: patches/nasm/nasm-disable-werror-attributes.patch
