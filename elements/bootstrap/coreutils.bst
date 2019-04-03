kind: autotools
description: GNU coreutils

depends:
- filename: bootstrap/coreutils-build-deps.bst
  type: build
- filename: bootstrap/acl.bst
  type: runtime

(@): elements/bootstrap/target.yml

environment:
  FORCE_UNSAFE_CONFIGURE: "1"

variables:
  conf-local: |
    --enable-install-program=hostname \
    --enable-no-install-program=kill,uptime \
    --enable-acl

  make-install: make -j1 install DESTDIR="%{install-root}" INSTALL=install

config:
  build-commands:
    (<):
    - |
      mkdir -p "%{builddir}/man"
      cp /coreutils-manpages/man1/* "%{builddir}/man/"

sources:
- kind: tar
  url: ftp_gnu_org:coreutils/coreutils-8.31.tar.xz
  ref: ff7a9c918edce6b4f4b2725e3f9b37b0c4d193531cac49a48b56c4d0d3a9e9fd
- kind: patch
  path: patches/coreutils/coreutils-no-man-deps.patch
