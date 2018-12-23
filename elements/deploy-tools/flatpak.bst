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
- filename: desktop/json-glib.bst
- filename: desktop/appstream-glib.bst
- filename: desktop/libseccomp.bst

variables:
  conf-local: --disable-system-helper --disable-documentation

sources:
- kind: git_tag
  url: github:flatpak/flatpak
  track: flatpak-1.0.x
  ref: 1.0.6-0-g38b5560c66a5b28287df964b6a61d928ec163ed2
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
