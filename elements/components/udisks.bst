kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/docbook-xsl.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst

depends:
- components/libatasmart.bst
- components/libblockdev.bst
- components/libgudev.bst
- components/polkit.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: github:storaged-project/udisks.git
  track: master
  ref: udisks-2.9.0-0-g5148afbf315842fcef38f8e49d3fec8d1b4d45c4
