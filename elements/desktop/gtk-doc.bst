kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/itstools.bst
- filename: base/autoconf.bst
  type: build
- filename: base/automake.bst
  type: build
- filename: base/docbook-xml.bst
- filename: base/docbook-xsl.bst
- filename: base/gettext.bst
  type: build
- filename: base/pkg-config.bst   # gtk-doc uses pkg-config during runtime.
- filename: base/libtool.bst
  type: build
- filename: base/python3.bst
- filename: base/which.bst
  type: build

sources:
- kind: git_tag
  url: gnome:gtk-doc.git
  track: master
  ref: GTK_DOC_1_29-0-g7db567e83fe5d2d0659560c6dfb25ee27b338140
