kind: manual

depends:
  - filename: base/bzip2.bst
    type: build
  - filename: base/man-pages-posix.bst

config:
  install-commands:
    - |
      make DESTDIR="%{install-root}" install

sources:
  - kind: tar
    url: https://www.kernel.org/pub/linux/docs/man-pages/man-pages-4.14.tar.xz
    ref: 3052b87898c313c089848a913e5cf44a0565cc4d21d94119ef6586d971f5c971
