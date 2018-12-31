kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
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
        - '%{libdir}/libss.so'
        - '%{libdir}/libcom_err.so'
        - '%{libdir}/libe2p.so'
        - '%{libdir}/libext2fs.so'

sources:
- kind: git_tag
  url: https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git
  track: master
  ref: v1.44.5-0-g9a03c07e00f09a772245281d84a284c67e905148
