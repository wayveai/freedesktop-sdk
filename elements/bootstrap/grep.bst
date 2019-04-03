kind: autotools
description: GNU grep

depends:
- filename: bootstrap/grep-build-deps.bst
  type: build
- filename: bootstrap/glibc.bst
  type: runtime

(@): elements/bootstrap/target.yml

sources:
- kind: tar
  url: ftp_gnu_org:grep/grep-3.1.tar.xz
  ref: db625c7ab3bb3ee757b3926a5cfa8d9e1c3991ad24707a83dde8a5ef2bf7a07e
