kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gtk-doc.bst
- components/valgrind-maybe.bst


depends:
- components/avahi.bst
- components/eos-metrics.bst
- components/flatpak.bst
- components/gobject-introspection.bst
- components/gnupg.bst
- components/libsoup2.bst
- components/mogwai.bst
- components/networkmanager.bst
- components/ostree.bst

sources:
- kind: git_tag
  url: github:endlessm/eos-updater.git
  track: master
  track-extra:
  - eos3.9
  ref: Release_3.9.7-0-g41600d4cda79fe905baad9cae47a58dc94393bd9
- kind: patch
  path: patches/eos-updater/remove-static-library-version.patch
