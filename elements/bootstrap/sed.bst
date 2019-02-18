kind: autotools
description: GNU sed

depends:
- filename: bootstrap/sed-build-deps.bst
  type: build
- filename: bootstrap/glibc.bst
  type: runtime

(@): elements/bootstrap/target.yml

sources:
- kind: tar
  url: ftp_gnu_org:sed/sed-4.5.tar.xz
  ref: 7aad73c8839c2bdadca9476f884d2953cdace9567ecd0d90f9959f229d146b40
