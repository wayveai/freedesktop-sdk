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
        - '%{libdir}/libpsx.so'

sources:
- kind: git_tag
  url: kernel:libs/libcap/libcap.git
  track: master
  match:
  - 'libcap-*'
  exclude:
  - 'libcap-korg-*'
  ref: libcap-2.50-0-g4408d8ae5b96c0f0ffca625c055fc4383ca9a8b8
- kind: patch
  path: patches/libcap/libcap-disable-tests.patch
