kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/glib.bst
- filename: components/vala-bootstrap.bst
  type: build
- filename: components/flex.bst
  type: build
- filename: components/bison.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/git-minimal.bst
  type: build

variables:
  builddir: ''
  conf-local: --disable-valadoc
  make: make bootstrap

sources:
- kind: git_tag
  # See https://wiki.gnome.org/Projects/Vala for last version
  url: gnome:vala.git
  track: master
  track-extra:
  - '0.48'
  # Note for updates: Stable minor versions are even.
  match:
  - "*.*[02468].*"
  ref: 0.48.6-0-gcfcc8afb3e95e9a1bcf5f5653b59e5d4c683b83a
