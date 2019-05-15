kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/m4.bst
  type: build

variables:
  conf-local: |
    --enable-cxx

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/"
      mv "%{install-root}%{includedir}/gmp.h" "%{install-root}%{includedir}/%{gcc_triplet}/"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgmp.so'
        - '%{libdir}/libgmpxx.so'

sources:
- kind: tar
  url: ftp_gnu_org:gmp/gmp-6.1.2.tar.xz
  ref: 87b565e89a9a684fe4ebeeddb8399dce2599f9c9049854ca8c0dfbdea0e21912
