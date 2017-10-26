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
  debugdir: "%{cross-debugdir}"

config:
  configure-commands:
  - |
    ./configure \
    --host=%{triple} \
    --build=$(sh /config/config.guess) \
    --prefix=%{prefix} \
    --disable-werror \
    --with-lib-path="%{libdir}"

  install-commands:
    - |
      %{cross-install}

sources:
- kind: tar
  url: http://ftp.gnu.org/gnu/binutils/binutils-2.29.tar.xz
  ref: 0b871e271c4c620444f8264f72143b4d224aa305306d85dd77ab8dce785b1e85
