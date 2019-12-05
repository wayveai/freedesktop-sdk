kind: manual

depends:
- filename: bootstrap-import.bst
- filename: base/which.bst
  type: build
- filename: base/gzip.bst
  type: build

config:
  build-commands:
    - |
      make OPT="${CFLAGS}" ZLIB=no SHARED=yes SHAREDIR="%{prefix}/share/hwdata" all

  install-commands:
    - |
      make SHARED=yes PREFIX="%{prefix}" SBINDIR="%{prefix}/bin" SHAREDIR="%{prefix}/share/hwdata" MANDIR="%{prefix}/share/man" LIBDIR="%{libdir}" DESTDIR="%{install-root}" install install-lib

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpci.so'

sources:
- kind: git_tag
  url: kernel:utils/pciutils/pciutils.git
  ref: v3.6.2-0-ge3832c8fc3efe41aff853d16cab488d38c3ac13f
