kind: autotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/itstools.bst

variables:
  conf-local: |
    PYTHON="/usr/bin/python3"

sources:
  - kind: tar
    url: https://download.gnome.org/sources/gtk-doc/1.27/gtk-doc-1.27.tar.xz
    ref: e26bd3f7080c749b1cb66c46c6bf8239e2f320a949964fb9c6d56e1b0c6d9a6f
