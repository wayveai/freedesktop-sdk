kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/perl.bst
  type: build

config:
  build-commands:
  - |
    make

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
  ref: libcap-2.55-0-g2bfe36c9999c852c79c0bba1c31b25285326b91d
- kind: patch
  path: patches/libcap/libcap-disable-tests.patch
