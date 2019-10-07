kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/itstools.bst
- filename: components/docbook-xml.bst
- filename: components/docbook-xsl.bst
- filename: components/pkg-config.bst   # gtk-doc uses pkg-config during runtime.
- filename: components/python3.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

sources:
- kind: git_tag
  url: gnome:gtk-doc
  track: master
  match:
  - 'GTK_DOC_1_29*'
  ref: GTK_DOC_1_29-0-g7db567e83fe5d2d0659560c6dfb25ee27b338140
