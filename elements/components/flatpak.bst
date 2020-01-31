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
  url: github:flatpak/flatpak.git
  track: master
  track-extra:
  - flatpak-1.4.x
  match:
  - 1.[02468]*
  ref: 1.6.1-0-g400a3358ec6e53e22957226f9d1cf22052fe7f4d
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
