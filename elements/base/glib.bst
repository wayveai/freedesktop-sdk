kind: meson
description: Glib

depends:
- filename: bootstrap-import.bst
- filename: base/libffi.bst
- filename: base/gettext.bst
  type: build
- filename: base/util-linux.bst
- filename: base/pcre.bst
- filename: base/python3.bst
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/m4.bst
  type: build
- filename: base/which.bst
  type: build

variables:
  meson-local: >
    -Dinternal_pcre=false
    -Dselinux=false

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
    - CVE-2019-13012

sources:
- kind: git_tag
  url: gnome:glib
  track: glib-2-58
  ref: 2.58.3-0-gf2d1128ffae0de87680e411fb62ccfccafed6b1c
- kind: patch
  path: patches/glib/glib-trash.patch
- kind: patch
  path: patches/glib/CVE-2019-12450.patch
- kind: patch
  path: patches/glib/CVE-2019-13012.patch
