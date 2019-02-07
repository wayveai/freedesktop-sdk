kind: autotools
description: GNU coreutils

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build
- filename: linux-headers.bst
  type: build
- filename: gcc-stage2.bst
  type: build
- filename: binutils-stage1.bst
  type: build
- filename: glibc.bst
  type: build
- filename: cross-installation-links.bst
  type: build
- filename: coreutils-manpages.bst
  type: build
- filename: acl.bst
- filename: debugedit-host.bst
  type: build

(@): target.yml

variables:
  conf-local: |
    --enable-install-program=hostname \
    --enable-no-install-program=kill,uptime \
    --enable-acl

config:
  build-commands:
    (<):
    - |
      mkdir -p "%{builddir}/man"
      cp /coreutils-manpages/man1/* "%{builddir}/man/"

  install-commands:
  - |
    cd "%{builddir}"
    %{cross-install} INSTALL=install

  - |
    %{delete_libtool_files}

sources:
- kind: tar
  url: ftp_gnu_org:coreutils/coreutils-8.30.tar.xz
  ref: e831b3a86091496cdba720411f9748de81507798f6130adeaef872d206e1b057
- kind: patch
  path: patches/coreutils/coreutils-no-man-deps.patch
