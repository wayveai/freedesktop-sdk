kind: autotools
description: GNU gcc stage 2

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
  (?):
    - target_arch == "arm":
        conf-extra: |
          --with-mode=thumb \
          --with-fpu=vfpv3-d16 \
          --with-arch=armv7-a \
          --with-float=hard

  conf-args: |
    --prefix=%{prefix} \
    --build=$(sh /config/config.guess) \
    --host=%{triplet} \
    --target=%{triplet} \
    --disable-multilib \
    --enable-multiarch \
    --disable-bootstrap \
    --enable-languages=c,c++ \
    %{conf-extra}

config:
  install-commands:
    - |
      cd %{builddir}
      %{cross-install}

    - |
      ln -s gcc %{install-root}%{sysroot}%{bindir}/cc

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{sysroot}%{bindir}/*"
          - "%{sysroot}%{libexecdir}"
          - "%{sysroot}%{libexecdir}/**"
          - "%{sysroot}%{datadir}/man"
          - "%{sysroot}%{datadir}/man/**"
          - "%{sysroot}%{datadir}/info"
          - "%{sysroot}%{datadir}/info/**"
          - "%{sysroot}%{datadir}/locale"
          - "%{sysroot}%{datadir}/locale/**"
          - "%{sysroot}%{libdir}/gcc"
          - "%{sysroot}%{libdir}/gcc/**"
          - "%{sysroot}%{libdir}/liblsan.so"
          - "%{sysroot}%{libdir}/libstdc++.so"
          - "%{sysroot}%{libdir}/libgomp.so"
          - "%{sysroot}%{libdir}/libatomic.so"
          - "%{sysroot}%{libdir}/libubsan.so"
          - "%{sysroot}%{libdir}/libquadmath.so"
          - "%{sysroot}%{libdir}/libitm.so"
          - "%{sysroot}%{libdir}/libtsan.so"
          - "%{sysroot}%{libdir}/libmpxwrappers.so"
          - "%{sysroot}%{libdir}/libmpx.so"
          - "%{sysroot}%{libdir}/libcilkrts.so"
          - "%{sysroot}%{libdir}/libssp.so"
          - "%{sysroot}%{libdir}/libasan.so"

sources:
- kind: tar
  url: ftp://ftp.fu-berlin.de/unix/languages/gcc/releases/gcc-7.3.0/gcc-7.3.0.tar.xz
  ref: 832ca6ae04636adbb430e865a1451adf6979ab44ca1c8374f61fba65645ce15c
- kind: tar
  url: http://ftp.gnu.org/gnu/gmp/gmp-6.1.2.tar.xz
  directory: gmp
  ref: 87b565e89a9a684fe4ebeeddb8399dce2599f9c9049854ca8c0dfbdea0e21912
- kind: tar
  url: http://ftp.gnu.org/gnu/mpfr/mpfr-4.0.1.tar.xz
  directory: mpfr
  ref: 67874a60826303ee2fb6affc6dc0ddd3e749e9bfcb4c8655e3953d0458a6e16e
- kind: tar
  url: http://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz
  directory: mpc
  ref: 6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e
- kind: patch
  path: elements/gcc-multiarch-os-dir.patch
