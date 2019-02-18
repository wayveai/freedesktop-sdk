kind: autotools
description: GNU findutils

depends:
- filename: bootstrap/findutils-build-deps.bst
  type: build
- filename: bootstrap/glibc.bst
  type: runtime

(@): elements/bootstrap/target.yml

sources:
- kind: tar
  url: ftp_gnu_org:findutils/findutils-4.6.0.tar.gz
  ref: ded4c9f73731cd48fec3b6bdaccce896473b6d8e337e9612e16cf1431bb1169d
- kind: patch
  path: patches/findutils/findutils-4.6.0-gnulib-fflush.patch
- kind: patch
  path: patches/findutils/findutils-4.6.0-gnulib-makedev.patch
