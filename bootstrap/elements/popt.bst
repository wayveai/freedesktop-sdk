kind: autotools

depends:
- filename: popt-build-deps.bst
  type: build
- filename: file.bst
  type: runtime

(@): target.yml

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpopt.so'

sources:
- kind: tar
  url: http://ftp.rpm.org/mirror/popt/popt-1.16.tar.gz
  ref: e728ed296fe9f069a0e005003c3d6b2dde3d9cad453422a10d6558616d304cc8
- kind: patch
  path: patches/popt/popt-1.16-pkgconfig.patch
