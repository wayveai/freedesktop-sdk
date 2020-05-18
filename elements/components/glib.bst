kind: meson
description: Glib

depends:
- filename: bootstrap-import.bst
- filename: components/libffi.bst
- filename: components/util-linux.bst
- filename: components/python3.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/gtk-doc.bst
  type: build

variables:
  meson-local: >-
    -Dinternal_pcre=false
    -Dselinux=disabled
    -Dgtk_doc=true

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
        - '%{libdir}/glib-2.0/include'
        - '%{libdir}/glib-2.0/include/**'

    integration-commands:
    - |
      glib-compile-schemas %{datadir}/glib-2.0/schemas

sources:
- kind: git_tag
  url: gnome:glib.git
  track: master
  track-extra:
  - glib-2-60
  match:
  - 2.*[02468].*
  ref: 2.64.0-0-g369626e3105d688afaa316d89d34e8927a8a0171
