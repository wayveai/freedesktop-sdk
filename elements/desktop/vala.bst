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
  url: https://download.gnome.org/sources/vala/0.44/vala-0.44.1.tar.xz
  ref: 96a8c1415c6484d7d6b837ae263af7c50465c7423bfc8eea5046f3eadfa42fe2
