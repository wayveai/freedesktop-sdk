kind: autotools

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgif.so'

  cpe:
    patches:
    - CVE-2019-15133

sources:
- kind: tar
  url: sourceforge_download:giflib/giflib-5.1.4.tar.bz2
  ref: df27ec3ff24671f80b29e6ab1c4971059c14ac3db95406884fc26574631ba8d5
- kind: patch
  path: patches/giflib/CVE-2019-15133.patch
