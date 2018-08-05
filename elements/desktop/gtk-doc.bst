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
  - filename: base/pkg-config.bst # gtk-doc uses pkg-config during runtime.
  - filename: base/libtool.bst
    type: build
  - filename: base/python3.bst
  - filename: base/which.bst
    type: build

sources:
  - kind: git
    url: https://gitlab.gnome.org/GNOME/gtk-doc.git
    ref: 695816a36b492140529ed84c59ee246be2b952b7 #  GTK_DOC_1_28
