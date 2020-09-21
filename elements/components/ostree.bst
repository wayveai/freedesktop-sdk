kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst
- components/gobject-introspection.bst
- components/bison.bst

depends:
- components/glib.bst
- components/gpgme.bst
- components/e2fsprogs.bst
- components/libsoup.bst
- components/fuse.bst
- components/systemd.bst
- components/libarchive.bst
- components/avahi.bst

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
      devel:
        (>):
        - "%{libdir}/libostree.so"

sources:
- kind: git_tag
  url: github:ostreedev/ostree.git
  track: main
  ref: v2021.6-0-gf1155c8d283c3c85d74d5e1050b0dcf8198f750a
- kind: git_module
  path: libglnx
  url: gnome:libglnx.git
  ref: ef502aabf7d3a0d37f9c4d228f870ac93404447b
- kind: git_module
  path: bsdiff
  url: github:mendsley/bsdiff.git
  ref: 1edf9f656850c0c64dae260960fabd8249ea9c60
- kind: patch
  path: patches/ostree/no-boot-symlink.patch
