kind: autotools
description: GNU gcc Stage 1

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build
- filename: binutils-stage1.bst
  type: build

(@): build.yml

variables:
  prefix: '%{tools}'
  lib: lib
  (?):
  - target_arch == "arm":
      conf-extra: |
        --with-mode=thumb \
        --with-fpu=vfpv3-d16 \
        --with-arch=armv7-a \
        --with-float=hard

  conf-local: |
    --target=%{triplet} \
    --with-newlib \
    --enable-multiarch \
    --with-sysroot=%{sysroot} \
    --without-headers \
    --disable-bootstrap \
    --disable-nls \
    --disable-shared \
    --disable-threads \
    --disable-libstdcxx \
    --disable-decimal-float \
    --disable-libatomic \
    --disable-libgomp \
    --disable-libmpx \
    --disable-libquadmath \
    --disable-libssp \
    --disable-libvtv \
    --disable-multilib \
    --enable-default-pie \
    --enable-default-ssp \
    --enable-languages=c,c++ \
    --without-isl \
    --enable-deterministic-archives \
    --enable-linker-build-id \
    %{conf-extra}

sources:
- kind: tar
  url: ftp_gnu_org:gcc/gcc-8.2.0/gcc-8.2.0.tar.xz
  ref: 196c3c04ba2613f893283977e6011b2345d1cd1af9abeac58e916b1aab3e0080
- kind: tar
  url: ftp_gnu_org:gmp/gmp-6.1.2.tar.xz
  directory: gmp
  ref: 87b565e89a9a684fe4ebeeddb8399dce2599f9c9049854ca8c0dfbdea0e21912
- kind: tar
  url: ftp_gnu_org:mpfr/mpfr-4.0.1.tar.xz
  directory: mpfr
  ref: 67874a60826303ee2fb6affc6dc0ddd3e749e9bfcb4c8655e3953d0458a6e16e
- kind: tar
  url: ftp_gnu_org:mpc/mpc-1.1.0.tar.gz
  directory: mpc
  ref: 6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e
- kind: patch
  path: patches/gcc-multiarch-os-dir.patch
