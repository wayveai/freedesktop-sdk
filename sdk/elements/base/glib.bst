kind: myautotools
description: Glib

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/libffi.bst
  - filename: base/gettext.bst
    type: build
  - filename: base/util-linux.bst
    type: build
  - filename: base/pcre.bst
  - filename: base/python2.bst
    type: build
  - filename: base/pkg-config-stage1.bst
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
    url: https://download.gnome.org/sources/glib/2.54/glib-2.54.1.tar.xz
    ref: 50c01b1419324f10fbf9b9709ec2164b18586968bdce7540583bf32302cf47a3
