kind: autotools
description: GNU gcc Stage 3

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
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
- filename: debugedit-host.bst
  type: build

environment:
  (?):
    - target_arch == "x86_64":
        CFLAGS_FOR_TARGET:  "%{target_flags_x86_64}"
        CXXFLAGS_FOR_TARGET: "%{target_flags_x86_64}"
        LDFLAGS_FOR_TARGET:  "%{ldflags_defaults}"
    - target_arch == "i686":
        CFLAGS_FOR_TARGET: "%{target_flags_i686}"
        CXXFLAGS_FOR_TARGET: "%{target_flags_i686}"
        LDFLAGS_FOR_TARGET:  "%{ldflags_defaults}"
    - target_arch == "arm":
        CFLAGS_FOR_TARGET:  "%{target_flags_arm}"
        CXXFLAGS_FOR_TARGET: "%{target_flags_arm}"
        LDFLAGS_FOR_TARGET:  "%{ldflags_defaults}"
    - target_arch == "aarch64":
        CFLAGS_FOR_TARGET:  "%{target_flags_aarch64}"
        CXXFLAGS_FOR_TARGET: "%{target_flags_aarch64}"
        LDFLAGS_FOR_TARGET:  "%{ldflags_defaults}"
    - build_arch == "x86_64":
        CFLAGS_FOR_BUILD:  "%{build_flags_x86_64}"
        CXXFLAGS_FOR_BUILD: "%{build_flags_x86_64}"
        LDFLAGS_FOR_BUILD:  "%{ldflags_defaults}"
    - build_arch == "i686":
        CFLAGS_FOR_BUILD: "%{build_flags_i686}"
        CXXFLAGS_FOR_BUILD: "%{build_flags_i686}"
        LDFLAGS_FOR_BUILD:  "%{ldflags_defaults}"
    - build_arch == "arm":
        CFLAGS_FOR_BUILD:  "%{build_flags_arm}"
        CXXFLAGS_FOR_BUILD: "%{build_flags_arm}"
        LDFLAGS_FOR_BUILD:  "%{ldflags_defaults}"
    - build_arch == "aarch64":
        CFLAGS_FOR_BUILD:  "%{build_flags_aarch64}"
        CXXFLAGS_FOR_BUILD: "%{build_flags_aarch64}"
        LDFLAGS_FOR_BUILD:  "%{ldflags_defaults}"

variables:
  host-triplet: '%{triplet}'
  build-triplet: '%{guessed-triplet}'
  (?):
  - target_arch == "arm":
      conf-extra: |
        --with-mode=thumb \
        --with-fpu=vfpv3-d16 \
        --with-arch=armv7-a \
        --with-float=hard

  # gcc installs correctly libraries in the multiarch library
  # directory, but needs to be provided /usr/lib for --libdir.
  lib: lib
  multiarch_libdir: '%{prefix}/lib/%{gcc_triplet}'

  conf-local: |
    --target=%{triplet} \
    --disable-multilib \
    --enable-multiarch \
    --disable-bootstrap \
    --with-build-sysroot=%{sysroot} \
    --enable-languages=c,c++,fortran \
    --enable-default-pie \
    --enable-default-ssp \
    --without-isl \
    --enable-linker-build-id \
    %{conf-extra}

  conf-link-args: |
    --enable-shared

config:
  install-commands:
  - |
    cd %{builddir}
    %{cross-install}

  - |
    ln -s gcc %{install-root}%{sysroot}%{bindir}/cc

  - |
    %{delete_libtool_files}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{sysroot}%{bindir}/*'
        - '%{sysroot}%{libexecdir}'
        - '%{sysroot}%{libexecdir}/**'
        - '%{sysroot}%{datadir}/man'
        - '%{sysroot}%{datadir}/man/**'
        - '%{sysroot}%{datadir}/info'
        - '%{sysroot}%{datadir}/info/**'
        - '%{sysroot}%{datadir}/locale'
        - '%{sysroot}%{datadir}/locale/**'
        - '%{sysroot}%{indep-libdir}/gcc'
        - '%{sysroot}%{indep-libdir}/gcc/**'
        - '%{sysroot}%{libdir}/gcc'
        - '%{sysroot}%{libdir}/gcc/**'
        - '%{sysroot}%{multiarch_libdir}/lib*.a'
        - '%{sysroot}%{multiarch_libdir}/liblsan.so'
        - '%{sysroot}%{multiarch_libdir}/libstdc++.so'
        - '%{sysroot}%{multiarch_libdir}/libgomp.so'
        - '%{sysroot}%{multiarch_libdir}/libatomic.so'
        - '%{sysroot}%{multiarch_libdir}/libubsan.so'
        - '%{sysroot}%{multiarch_libdir}/libquadmath.so'
        - '%{sysroot}%{multiarch_libdir}/libitm.so'
        - '%{sysroot}%{multiarch_libdir}/libtsan.so'
        - '%{sysroot}%{multiarch_libdir}/libmpxwrappers.so'
        - '%{sysroot}%{multiarch_libdir}/libmpx.so'
        - '%{sysroot}%{multiarch_libdir}/libcilkrts.so'
        - '%{sysroot}%{multiarch_libdir}/libssp.so'
        - '%{sysroot}%{multiarch_libdir}/libasan.so'
        - '%{sysroot}%{multiarch_libdir}/libgfortran.so'
        - '%{sysroot}%{multiarch_libdir}/libcc1.so'
        - '%{sysroot}%{multiarch_libdir}/libgcc_s.so'

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
  path: patches/gcc/gcc-multiarch-os-dir.patch
