kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/which.bst
  type: build
- filename: base/git-minimal.bst
  type: build
- filename: base/gettext.bst
  type: build
- filename: base/gpgme.bst
- filename: desktop/gobject-introspection.bst
  type: build
- filename: base/libcap.bst
- filename: base/libarchive.bst
- filename: base/libxml2.bst
- filename: desktop/libsoup.bst
- filename: desktop/xorg-lib-xau.bst
- filename: deploy-tools/ostree.bst
- filename: deploy-tools/fuse.bst
- filename: desktop/json-glib.bst
- filename: desktop/appstream-glib.bst
- filename: desktop/libseccomp.bst

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
