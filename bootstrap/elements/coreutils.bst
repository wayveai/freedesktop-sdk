kind: autotools
description: GNU coreutils

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: dependencies/config.bst
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

variables:
  build-triplet: "$(sh /config/config.guess)"
  host-triplet: "%{triplet}"
  conf-local: |
    --enable-install-program=hostname \
    --enable-no-install-program=kill,uptime \
    --enable-acl \
    ac_cv_search_acl_get_file="-lattr -lacl"

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
  url: https://ftp.gnu.org/gnu/coreutils/coreutils-8.30.tar.xz
  ref: e831b3a86091496cdba720411f9748de81507798f6130adeaef872d206e1b057
- kind: patch
  path: patches/coreutils-no-man-deps.patch
