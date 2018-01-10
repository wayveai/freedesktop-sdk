kind: myautotools
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
  conf-args: |
    --build=$(sh /config/config.guess) \
    --host=%{triplet} \
    --prefix=%{prefix} \
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

sources:
- kind: tar
  url: http://ftp.gnu.org/gnu/coreutils/coreutils-8.28.tar.xz
  ref: 1117b1a16039ddd84d51a9923948307cfa28c2cea03d1a2438742253df0a0c65
- kind: patch
  path: elements/coreutils-no-man-deps.patch
