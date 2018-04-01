kind: autotools
description: GNU Binutils

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

variables:
  conf-args: |
    --host=%{triplet} \
    --build=$(sh /config/config.guess) \
    --prefix=%{prefix} \
    --disable-werror \
    --with-lib-path="%{libdir}:%{indep-libdir}" \
    --libdir="%{libdir}" \
    --enable-shared

config:
  install-commands:
    - |
      cd "%{builddir}"
      %{cross-install}

    - |
      %{delete_libtool_files}

environment:
  LEXLIB: " "

sources:
- kind: tar
  url: https://sourceware.org/pub/binutils/releases/binutils-2.30.tar.xz
  ref: 6e46b8aeae2f727a36f0bd9505e405768a72218f1796f0d09757d45209871ae6
