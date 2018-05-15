kind: autotools
description: GNU C Library

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: dependencies/config.bst
  type: build
- filename: linux-headers.bst
  type: build
- filename: gcc-stage1.bst
  type: build
- filename: binutils-stage1.bst
  type: build
- filename: glibc.bst
  type: build
- filename: cross-installation-links.bst
  type: build

variables:
  lib: "lib"

  host-triplet: "%{triplet}"
  build-triplet: "$(sh /config/config.guess)"
  conf-local: |
      --enable-multiarch \
      --disable-nls \
      --disable-multilib

config:
  configure-commands:
    - |
      mkdir "%{builddir}"
      cd "%{builddir}"
      ../libstdc++-v3/%{configure}

  install-commands:
    - |
      cd "%{builddir}"
      %{cross-install}

    - |
      %{delete_libtool_files}

environment:
  CPPFLAGS: ""
  CFLAGS: "-O2 -g"
  CXXFLAGS: "-O2 -g"
  LDFLAGS: ""

sources:
- kind: tar
  url: ftp://ftp.fu-berlin.de/unix/languages/gcc/releases/gcc-8.1.0/gcc-8.1.0.tar.xz
  ref: 1d1866f992626e61349a1ccd0b8d5253816222cdc13390dcfaa74b093aa2b153
