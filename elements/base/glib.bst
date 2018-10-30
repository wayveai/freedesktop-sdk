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
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/which.bst
  type: build

variables:
  conf-local: |
    --with-pcre=system

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{datadir}/glib-2.0/codegen'
        - '%{datadir}/glib-2.0/codegen/**'
        - '%{bindir}/glib-compile-resources'
        - '%{bindir}/glib-genmarshal'
        - '%{bindir}/glib-gettextize'
        - '%{bindir}/glib-mkenums'
        - '%{bindir}/gdbus-codegen'
        - '%{bindir}/gobject-query'
        - '%{bindir}/gresource'
        - '%{bindir}/gtester*'
        - '%{libdir}/libglib-2.0.so'
        - '%{libdir}/libgmodule-2.0.so'
        - '%{libdir}/libgobject-2.0.so'
        - '%{libdir}/libgio-2.0.so'
        - '%{libdir}/libgthread-2.0.so'

    integration-commands:
    - |
      glib-compile-schemas %{datadir}/glib-2.0/schemas

sources:
- kind: git_tag
  url: https://gitlab.gnome.org/GNOME/glib
  ref: d4b60396c79c7294ab69a2c591518e76ab17b603      #2.56.2
- kind: patch
  path: patches/glib-gio-Makefile.am-Use-PYTHON-to-call-python-script.patch
