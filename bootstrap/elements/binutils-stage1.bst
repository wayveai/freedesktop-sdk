kind: myautotools
description: GNU Binutils Stage 1

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: dependencies/config.bst
  type: build

variables:
  conf-args: |
    --target=%{triplet} \
    --build=$(sh /config/config.guess) \
    --host=$(sh /config/config.guess) \
    --prefix=%{tools} \
    --with-sysroot=%{sysroot} \
    --disable-nls \
    --disable-multilib \
    --disable-werror \
    --with-lib-path="%{libdir}:%{indep-libdir}"

sources:
- kind: tar
  url: http://ftp.gnu.org/gnu/binutils/binutils-2.29.1.tar.xz
  ref: e7010a46969f9d3e53b650a518663f98a5dde3c3ae21b7d71e5e6803bc36b577
