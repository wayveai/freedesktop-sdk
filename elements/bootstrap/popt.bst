kind: autotools

depends:
- filename: bootstrap/popt-build-deps.bst
  type: build
- filename: bootstrap/file.bst
  type: runtime

(@): elements/bootstrap/include/target.yml

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpopt.so'

sources:
- kind: tar
  url: tar_http:ftp.rpm.org/mirror/popt/popt-1.16.tar.gz
  ref: e728ed296fe9f069a0e005003c3d6b2dde3d9cad453422a10d6558616d304cc8
- kind: patch
  path: patches/popt/popt-1.16-pkgconfig.patch
