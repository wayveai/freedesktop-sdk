kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/which.bst
  type: build
- filename: components/gzip.bst
  type: build

config:
  build-commands:
    - |
      make OPT="${CFLAGS}" ZLIB=no SHARED=yes SHAREDIR="%{prefix}/share/hwdata" all

  install-commands:
    - |
      make SHARED=yes PREFIX="%{prefix}" SBINDIR="%{prefix}/bin" SHAREDIR="%{prefix}/share/hwdata" MANDIR="%{prefix}/share/man" LIBDIR="%{libdir}" DESTDIR="%{install-root}" install install-lib

    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/pci"
      mv "%{install-root}%{includedir}/pci/config.h" "%{install-root}%{includedir}/%{gcc_triplet}/pci/"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpci.so'

sources:
- kind: git_tag
  track: master
  url: kernel:utils/pciutils/pciutils.git
  ref: v3.6.2-0-ge3832c8fc3efe41aff853d16cab488d38c3ac13f
