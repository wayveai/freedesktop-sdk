kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/perl.bst
  type: build

config:
  build-commands:
  - |
    make CFLAGS="$CFLAGS -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS="$LDFLAGS"

  install-commands:
  - |
    make -j1 prefix="%{prefix}" lib="lib/%{gcc_triplet}" SBINDIR="%{sbindir}" DESTDIR="%{install-root}" RAISE_SETFCAP=no install

  - |
    find "%{install-root}" -name "lib*.a" -exec rm {} ";"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libcap.so'

sources:
- kind: tar
  url: tar_https:www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.27.tar.xz
  ref: dac1792d0118bee6aae6ba7fb93ff1602c6a9bda812fd63916eee1435b9c486a
