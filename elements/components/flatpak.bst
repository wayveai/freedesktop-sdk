kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/git-minimal.bst
  type: build
- filename: components/gettext.bst
  type: build
- filename: components/gpgme.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: components/libcap.bst
- filename: components/libarchive.bst
- filename: components/libxml2.bst
- filename: components/libsoup.bst
- filename: components/xorg-lib-xau.bst
- filename: components/ostree.bst
- filename: components/fuse.bst
- filename: components/json-glib.bst
- filename: components/appstream-glib.bst
- filename: components/libseccomp.bst

variables:
  conf-local: --disable-system-helper --disable-documentation

sources:
- kind: git_tag
  url: github:flatpak/flatpak
  track: master
  track-extra:
  - flatpak-1.4.x
  match:
  - 1.[02468]*
  ref: 1.4.3-0-g0736b524bfd31a7ee5568b0e46c501e5236d2373
  submodules:
    libglnx:
      checkout: true
      url: gnome:libglnx.git
    bubblewrap:
      checkout: true
      url: github:projectatomic/bubblewrap.git
    dbus-proxy:
      checkout: true
      url: github:flatpak/xdg-dbus-proxy.git
