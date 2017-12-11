kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build
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
    url: http://prdownloads.sourceforge.net/e2fsprogs/e2fsprogs-1.43.7.tar.gz
    ref: 87035f2eae8da5f9869f78ffc177969b4e3cf75a5da489521c1ffe4268e1a1c4
