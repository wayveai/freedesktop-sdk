kind: autotools

depends:
  - filename: base.bst
    type: build

variables:
  conf-local: |
      --disable-static \
      --disable-man

sources:
  - kind: tar
    url: https://download.gnome.org/sources/dconf/0.26/dconf-0.26.1.tar.xz
    ref: d583b1f7fc93b879e2956acc6a26ea05a445a0002158aeef80c8e378e1414535
  - kind: patch
    path: elements/desktop/dconf-override.patch
