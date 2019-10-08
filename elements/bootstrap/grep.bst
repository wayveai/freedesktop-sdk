kind: autotools
description: GNU grep

depends:
- filename: bootstrap/grep-build-deps.bst
  type: build
- filename: bootstrap/glibc.bst
  type: runtime
- filename: bootstrap/pcre.bst
  type: runtime

(@): elements/bootstrap/include/target.yml

variables:
  conf-local: >-
    --enable-perl-regexp

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: tar
  url: ftp_gnu_org:grep/grep-3.3.tar.xz
  ref: b960541c499619efd6afe1fa795402e4733c8e11ebf9fafccc0bb4bccdc5b514
