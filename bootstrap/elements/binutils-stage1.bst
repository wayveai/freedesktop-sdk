kind: autotools
description: GNU Binutils Stage 1

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build

(@): build.yml

variables:
  lib: lib
  prefix: '%{tools}'
  conf-local: |
    --target=%{triplet} \
    --with-sysroot=%{sysroot} \
    --disable-nls \
    --disable-multilib \
    --disable-werror \
    --with-lib-path="%{sysroot}/usr/lib/%{gcc_triplet}:%{sysroot}/usr/lib:/usr/lib/%{gcc_triplet}:/usr/lib"

sources:
- kind: tar
  url: sourceware_pub:binutils/releases/binutils-2.31.1.tar.xz
  ref: 5d20086ecf5752cc7d9134246e9588fa201740d540f7eb84d795b1f7a93bca86
