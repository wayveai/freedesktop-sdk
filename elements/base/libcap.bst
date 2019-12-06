kind: manual

depends:
- filename: bootstrap-import.bst
- filename: base/perl.bst
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
  url: tar_https:www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.26.tar.xz
  ref: b630b7c484271b3ba867680d6a14b10a86cfa67247a14631b14c06731d5a458b

