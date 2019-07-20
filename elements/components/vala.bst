kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/glib.bst
- filename: components/flex.bst
  type: build
- filename: components/bison.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: --disable-valadoc

sources:
- kind: tar
  # Note for updates: Stable minor versions are even.
  # See https://wiki.gnome.org/Projects/Vala for last version
  url: https://download.gnome.org/sources/vala/0.44/vala-0.44.6.tar.xz
  ref: ab9f1756af7460aa1e39c9a7388f5492a4252a3cd9c76b02f2033f1dedcd793a
