kind: manual

depends:
- filename: bootstrap-import.bst

config:
  install-commands:
  - |
    make DESTDIR="%{install-root}" install

sources:
- kind: tar
  url: tar_https:www.kernel.org/pub/linux/docs/man-pages/man-pages-posix/man-pages-posix-2017-a.tar.xz
  ref: ce67bb25b5048b20dad772e405a83f4bc70faf051afa289361c81f9660318bc3
