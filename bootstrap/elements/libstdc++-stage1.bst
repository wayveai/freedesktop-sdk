kind: myautotools
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

environment:
  CFLAGS: "-O2 -g"
  CXXFLAGS: "-O2 -g"
  LDFLAGS: ""

sources:
- kind: tar
  url: ftp://ftp.fu-berlin.de/unix/languages/gcc/releases/gcc-7.2.0/gcc-7.2.0.tar.xz
  ref: 1cf7adf8ff4b5aa49041c8734bbcf1ad18cc4c94d0029aae0f4e48841088479a
