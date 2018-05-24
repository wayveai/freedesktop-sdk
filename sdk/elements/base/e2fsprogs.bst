kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/pkg-config.bst
    type: build
  - filename: base/util-linux.bst

variables:
  conf-local: |
    --disable-libblkid \
    --disable-libuuid \
    --disable-fsck \
    --disable-uuidd

sources:
  - kind: tar
    url: http://prdownloads.sourceforge.net/e2fsprogs/e2fsprogs-1.44.0.tar.gz
    ref: 04abf8c2c7c9a70aa3aa9757da23a929baf18423ccd06e8a0320c2effe091fd1
