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
  url: ftp_gnu_org:gmp/gmp-6.2.0.tar.xz
  ref: 258e6cd51b3fbdfc185c716d55f82c08aff57df0c6fbd143cf6ed561267a1526
