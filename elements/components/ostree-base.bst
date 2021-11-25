kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst

- components/gpgme.bst
- components/glib.bst
- components/bison.bst
- components/e2fsprogs.bst
- components/libsoup.bst
- components/fuse.bst
- components/systemd.bst
- components/libarchive.bst
- components/avahi.bst
- components/avahi-gobject.bst
- components/gobject-introspection.bst

variables:
  conf-local: >-
    --with-dracut
    --with-libsystemd
    --with-systemd
    --with-libarchive
    --with-avahi

public:
  bst:
    split-rules:
      gobject:
      - "%{libdir}/girepository-1.0"
      - "%{libdir}/girepository-1.0/**"
      - "%{datadir}/gir-1.0"
      - "%{datadir}/gir-1.0/**"

sources:
- kind: git_tag
  url: github:ostreedev/ostree.git
  track: main
  ref: v2021.6-0-gf1155c8d283c3c85d74d5e1050b0dcf8198f750a
  submodules:
    libglnx:
      checkout: true
      url: gnome:libglnx.git
    bsdiff:
      checkout: true
      url: github:mendsley/bsdiff.git
- kind: patch
  path: patches/ostree/no-boot-symlink.patch
