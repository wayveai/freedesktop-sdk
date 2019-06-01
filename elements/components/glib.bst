kind: meson
description: Glib

depends:
- filename: bootstrap-import.bst
- filename: components/libffi.bst
- filename: components/util-linux.bst
- filename: components/pcre.bst
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

    integration-commands:
    - |
      glib-compile-schemas %{datadir}/glib-2.0/schemas

  cpe:
    patches:
    - CVE-2019-12450

sources:
- kind: git_tag
  url: gnome:glib
  track: master
  track-extra:
  - glib-2-60
  match:
  - 2.*[02468].*
  ref: 2.60.3-0-g0f6191d02a8e1ca7b08ffe0ccc4def88855baeae
- kind: patch
  path: patches/glib/CVE-2019-12450.patch
