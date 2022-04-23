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
  track: '0.56'
  # Note for updates: Stable minor versions are even.
  match:
  - "*.*[02468].*"
  ref: 0.56.1-0-gef23c1bd93e5c4f3e52f87ef98e3cf7a833a18d9
