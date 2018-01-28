kind: autotools
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
  url: https://sourceware.org/pub/binutils/releases/binutils-2.30.tar.xz
  ref: 6e46b8aeae2f727a36f0bd9505e405768a72218f1796f0d09757d45209871ae6
