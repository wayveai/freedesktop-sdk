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

config:
  configure-commands:
    - |
      mkdir "%{builddir}"
      cd "%{builddir}"
      ../libstdc++-v3/configure \
      --host=%{triplet} \
      --build=$(sh /config/config.guess) \
      --enable-multiarch \
      --prefix=%{prefix} \
      --disable-nls \
      --disable-multilib

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
  url: ftp://ftp.fu-berlin.de/unix/languages/gcc/releases/gcc-7.3.0/gcc-7.3.0.tar.xz
  ref: 832ca6ae04636adbb430e865a1451adf6979ab44ca1c8374f61fba65645ce15c
