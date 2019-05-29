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
  ref: 1.4.0-0-g170b0e2b8efa5ead04a3ee1c97893336ea4912e7
  submodules:
    libglnx:
      checkout: True
      url: gnome:libglnx.git
    bubblewrap:
      checkout: True
      url: github:projectatomic/bubblewrap.git
    dbus-proxy:
      checkout: True
      url: github:flatpak/xdg-dbus-proxy.git
