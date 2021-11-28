kind: meson

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/gtk-doc.bst
  type: build
- filename: components/valgrind-maybe.bst
  type: build
- filename: components/ostree.bst
- filename: components/flatpak.bst
- filename: components/gobject-introspection.bst
- filename: components/gnupg.bst

- filename: components/networkmanager.bst
- filename: components/eos-metrics.bst
- filename: components/avahi.bst
- filename: components/mogwai.bst

sources:
- kind: git_tag
  url: github:endlessm/eos-updater.git
  track: master
  track-extra:
  - eos3.9
  ref: Release_3.9.5-0-g6129ccc93e5493cde8b2a3a5c83eebb6124599ec
- kind: patch
  path: patches/eos-updater/remove-static-library-version.patch
