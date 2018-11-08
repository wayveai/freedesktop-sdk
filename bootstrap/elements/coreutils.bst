kind: autotools
description: GNU coreutils

depends:
- filename: coreutils-build-deps.bst
  type: build
- filename: acl.bst
  type: runtime

(@): target.yml

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
  url: ftp_gnu_org:coreutils/coreutils-8.30.tar.xz
  ref: e831b3a86091496cdba720411f9748de81507798f6130adeaef872d206e1b057
- kind: patch
  path: patches/coreutils/coreutils-no-man-deps.patch
