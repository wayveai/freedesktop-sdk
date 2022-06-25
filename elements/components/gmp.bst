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
  url: ftp_gnu_org:gmp/gmp-6.2.1.tar.xz
  ref: fd4829912cddd12f84181c3451cc752be224643e87fac497b69edddadc49b4f2
