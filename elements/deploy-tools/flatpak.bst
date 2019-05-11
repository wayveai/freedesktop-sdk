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
- filename: deploy-tools/ostree.bst
- filename: components/json-glib.bst
- filename: components/appstream-glib.bst
- filename: components/libseccomp.bst

variables:
  conf-local: --disable-system-helper --disable-documentation

sources:
- kind: git_tag
  url: github:flatpak/flatpak
  track: flatpak-1.2.x
  ref: 1.2.3-0-g428c7bf8566d1cdb9f5eafccde1a19a41aeab144
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
