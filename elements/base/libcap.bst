kind: manual

depends:
- filename: bootstrap-import.bst
- filename: base/perl.bst
  type: build

config:
  build-commands:
  - |
    make

  install-commands:
  - |
    make -j1 prefix="%{prefix}" lib="lib/%{gcc_triplet}" SBINDIR="%{sbindir}" DESTDIR="%{install-root}" RAISE_SETFCAP=no install

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libcap.so'

sources:
- kind: tar
  url: https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.25.tar.xz
  ref: 693c8ac51e983ee678205571ef272439d83afe62dd8e424ea14ad9790bc35162

