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
  track: master
  ref: v2020.8-0-g3e289b19345e30d2da193cd208e109f7d7aaa2a1
  submodules:
    libglnx:
      checkout: true
      url: gnome:libglnx.git
    bsdiff:
      checkout: true
      url: github:mendsley/bsdiff.git
- kind: patch
  path: patches/ostree/no-boot-symlink.patch
