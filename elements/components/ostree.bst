kind: filter

build-depends:
- components/ostree-base.bst

runtime-depends:
- components/gpgme.bst
- components/glib.bst
- components/bison.bst
- components/e2fsprogs.bst
- components/libsoup.bst
- components/fuse.bst
- components/systemd.bst
- components/libarchive.bst
- components/avahi.bst

- components/ostree-manifest.bst

config:
  exclude:
  - gobject
  include-orphans: True

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libostree.so"
