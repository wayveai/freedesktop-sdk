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
  # Note for updates: Stable minor versions are even.
  # See https://wiki.gnome.org/Projects/Vala for last version
  url: https://download.gnome.org/sources/vala/0.44/vala-0.44.7.tar.xz
  ref: bf1ff4f59d5de2d626e98e98ef81cb75dc1e6a27610a7de4133597c430f1bd7c
