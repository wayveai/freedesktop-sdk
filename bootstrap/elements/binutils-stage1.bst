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
  url: sourceware_pub:binutils/releases/binutils-2.31.tar.xz
  ref: 231036df7ef02049cdbff0681f4575e571f26ea8086cf70c2dcd3b6c0f4216bf
