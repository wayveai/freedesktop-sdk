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
  url: repo_or_cz:nasm.git
  track: master
  exclude:
  - nasm-*rc*
  ref: nasm-2.14.02-0-g74246c499ea4313fb8837977dc0c135fc50567c0
- kind: patch
  path: patches/nasm/nasm-disable-werror-attributes.patch
