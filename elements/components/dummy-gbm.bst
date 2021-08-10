kind: meson
description: |
  This provides libgbm with out any backend. This is to be used in the
  SDK for applications to link against. It should also be in the
  platform if not GL extension loaded provides libgbm.  However if it
  is present in a GL extension, it should be loaded instead.

depends:
- filename: bootstrap-import.bst
- filename: components/libdrm.bst
  # It just needs one header from extension at build time to get a PCI ID.
- filename: extensions/mesa/libdrm.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/python3.bst
  type: build
- filename: components/python3-mako.bst
  type: build
- filename: components/bison.bst
  type: build
- filename: components/flex.bst
  type: build

(@):
- elements/include/mesa.yml

environment:
  PKG_CONFIG_PATH: ":%{libdir}/GL/default/lib/pkgconfig"

variables:
  meson-local: >-
    -Db_ndebug=true
    -Dvulkan-drivers=""
    -Ddri-drivers=""
    -Dgallium-drivers=""
    -Dplatforms=""
    -Dtools=""
    -Ddri3=false
    -Degl=false
    -Dgbm=true
    -Dgles1=false
    -Dgles2=false
    -Dglx=disabled
    -Dlmsensors=false
    -Dmicrosoft-clc=disabled
    -Dosmesa=false
    -Dselinux=false
    -Dshared-glapi=false
    -Dvalgrind=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgbm.so'

config:
  install-commands:
    (>):
    - |
      rm -rf "%{install-root}%{datadir}"

sources:
  (>):
  - kind: patch
    path: patches/mesa/mesa-break-build-dep-libdrm-nouveau.patch
  - kind: patch
    path: patches/mesa/mesa-disable-gbm-backends.patch
  - kind: patch
    path: patches/mesa/mesa-gbm-force-libdrm-dep.patch
