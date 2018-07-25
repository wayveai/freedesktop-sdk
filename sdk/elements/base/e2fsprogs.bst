kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/pkg-config.bst
    type: build
  - filename: base/util-linux.bst

variables:
  conf-local: |
    --enable-elf-shlibs \
    --disable-libblkid \
    --disable-libuuid \
    --disable-fsck \
    --disable-uuidd

  make-install: make -j1 DESTDIR="%{install-root}" install install-libs

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libss.so"
          - "%{libdir}/libcom_err.so"
          - "%{libdir}/libe2p.so"
          - "%{libdir}/libext2fs.so"

sources:
  - kind: tar
    url: https://sourceforge.net/projects/e2fsprogs/files/e2fsprogs/v1.44.3/e2fsprogs-1.44.3.tar.gz
    ref: c2ae6d8ce6fb96b55886cf761411fc22ab41976f4f8297fc54c706df442483be
