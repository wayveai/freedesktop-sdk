kind: manual

depends:
- filename: bootstrap-import.bst

config:
  build-commands:
  - |
    make bz2

  install-commands:
  - |
    make DESTDIR="%{install-root}" install

sources:
- kind: tar
  url: tar_https:www.kernel.org/pub/linux/docs/man-pages/man-pages-posix/man-pages-posix-2013-a.tar.xz
  ref: 19633a5c75ff7deab35b1d2c3d5b7748e7bd4ef4ab598b647bb7e7f60b90a808
