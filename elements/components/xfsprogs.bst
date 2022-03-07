kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/icu.bst
- components/inih.bst
- components/util-linux.bst

variables:
  build-dir: ''
  make-args: >-
    PKG_ROOT_SBIN_DIR='%{sbindir}'
    PKG_ROOT_LIB_DIR='%{libdir}'
    PKG_LIB_DIR='%{libdir}'
  make: make %{make-args}
  make-install: make %{make-args} -j1 install install-dev DESTDIR='%{install-root}'

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libhandle.so'

sources:
- kind: tar
  url: tar_https:mirrors.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-5.13.0.tar.xz
  ref: 4e142d4babe086adf9016d8c606c805829da08e46389a4433f40346204f90cdb
