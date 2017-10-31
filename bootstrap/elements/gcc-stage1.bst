kind: autotools
description: GNU gcc Stage 1

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: dependencies/config.bst
  type: build
- filename: binutils-stage1.bst
  type: build

variables:
  debugdir: "%{tools-debugdir}"

config:
  configure-commands:
    - |
      mkdir build && \
      cd build && \
      ../configure \
      --prefix=%{tools} \
      --build=$(sh /config/config.guess) \
      --host=$(sh /config/config.guess) \
      --target=%{triple} \
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
      --enable-languages=c,c++

  build-commands:
    - |
      cd build && %{make}
  install-commands:
    - |
      cd build && %{make-install}

sources:
- kind: tar
  url: ftp://ftp.fu-berlin.de/unix/languages/gcc/releases/gcc-7.2.0/gcc-7.2.0.tar.xz
  ref: 1cf7adf8ff4b5aa49041c8734bbcf1ad18cc4c94d0029aae0f4e48841088479a
- kind: tar
  url: http://ftp.gnu.org/gnu/gmp/gmp-6.1.2.tar.xz
  directory: gmp
  ref: 87b565e89a9a684fe4ebeeddb8399dce2599f9c9049854ca8c0dfbdea0e21912
- kind: tar
  url: http://ftp.gnu.org/gnu/mpfr/mpfr-3.1.6.tar.xz
  directory: mpfr
  ref: 7a62ac1a04408614fccdc506e4844b10cf0ad2c2b1677097f8f35d3a1344a950
- kind: tar
  url: http://ftp.gnu.org/gnu/mpc/mpc-1.0.3.tar.gz
  directory: mpc
  ref: 617decc6ea09889fb08ede330917a00b16809b8db88c29c31bfbb49cbf88ecc3
