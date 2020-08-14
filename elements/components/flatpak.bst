kind: autotools

depends:
- bootstrap-import.bst
- components/gpgme.bst
- components/libcap.bst
- components/libarchive.bst
- components/libxml2.bst
- components/libsoup.bst
- components/xorg-lib-xau.bst
- components/ostree.bst
- components/fuse.bst
- components/json-glib.bst
- components/appstream-glib.bst
- components/libseccomp.bst
- components/polkit.bst

build-depends:
- components/python3-pyparsing.bst
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst
- components/gettext.bst
- components/gobject-introspection.bst

variables:
  conf-local: --disable-documentation

sources:
- kind: git_tag
  url: github:flatpak/flatpak.git
  track: master
  track-extra:
  - flatpak-1.8.x
  match:
  - 1.[02468]*
  ref: 1.8.1-0-g2e9776f209e814e256dd7d42661d2455b6516d01
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
    variant-schema-compiler:
      checkout: true
      url: git_https:gitlab.gnome.org/alexl/variant-schema-compiler.git
