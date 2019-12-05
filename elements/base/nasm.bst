kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/asciidoc.bst
  type: build
- filename: base/groff.bst
  type: build
- filename: base/xmlto.bst
  type: build
- filename: base/docbook-xml.bst
  type: build
- filename: base/docbook-xsl.bst
  type: build
- filename: base/libxslt.bst
  type: build

variables:
  builddir: ''

config:
  build-commands:
    (>):
    - make manpages

sources:
- kind: git_tag
  url: repo_or_cz:nasm.git
  track: master
  ref:  nasm-2.14.02-0-ga73b8be6f0f9e307e3c6131011a30f2fd5b00877
- kind: patch
  path: patches/nasm/nasm-disable-werror-attributes.patch
