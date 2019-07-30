kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/glib.bst
- filename: base/flex.bst
  type: build
- filename: base/bison.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build

variables:
  conf-local: --disable-valadoc

sources:
- kind: tar
  url: https://download.gnome.org/sources/vala/0.44/vala-0.44.6.tar.xz
  ref: ab9f1756af7460aa1e39c9a7388f5492a4252a3cd9c76b02f2033f1dedcd793a
