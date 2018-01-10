kind: myautotools
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
    --with-lib-path="%{libdir}:%{indep-libdir}"

config:
  install-commands:
    - |
      cd "%{builddir}"
      %{cross-install}

environment:
  LEXLIB: " "

sources:
- kind: tar
  url: http://ftp.gnu.org/gnu/binutils/binutils-2.29.1.tar.xz
  ref: e7010a46969f9d3e53b650a518663f98a5dde3c3ae21b7d71e5e6803bc36b577
