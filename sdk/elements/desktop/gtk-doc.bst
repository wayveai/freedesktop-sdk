kind: myautotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/itstools.bst

variables:
  conf-extra:
    PYTHON="/usr/bin/python2"

sources:
  - kind: tar
    url: https://download.gnome.org/sources/gtk-doc/1.26/gtk-doc-1.26.tar.xz
    ref: bff3f44467b1d39775e94fad545f050faa7e8d68dc6a31aef5024ba3c2d7f2b7
