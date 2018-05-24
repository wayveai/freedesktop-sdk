kind: autotools
description: Glib

depends:
  - filename: bootstrap-import.bst
  - filename: base/libffi.bst
  - filename: base/gettext.bst
    type: build
  - filename: base/util-linux.bst
  - filename: base/pcre.bst
  - filename: base/python3.bst
    type: build
  - filename: base/pkg-config.bst
    type: build

variables:
  conf-local: |
    --with-pcre=system

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{datadir}/glib-2.0/codegen"
          - "%{datadir}/glib-2.0/codegen/**"
          - "%{bindir}/glib-*"
          - "%{bindir}/gdbus-codegen"
          - "%{bindir}/gobject-query"
          - "%{bindir}/gresource"
          - "%{bindir}/gtester*"
          - "%{libdir}/libglib-2.0.so"
          - "%{libdir}/libgmodule-2.0.so"
          - "%{libdir}/libgobject-2.0.so"
          - "%{libdir}/libgio-2.0.so"
          - "%{libdir}/libgthread-2.0.so"

    integration-commands:
      - |
        glib-compile-schemas %{datadir}/glib-2.0/schemas

sources:
  - kind: tar
    url: https://download.gnome.org/sources/glib/2.56/glib-2.56.1.tar.xz
    ref: 40ef3f44f2c651c7a31aedee44259809b6f03d3d20be44545cd7d177221c0b8d
