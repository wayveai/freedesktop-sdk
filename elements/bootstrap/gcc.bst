kind: autotools
description: GNU gcc Stage 3

depends:
- filename: bootstrap/gcc-build-deps.bst
  type: build
- filename: bootstrap/binutils.bst
  type: runtime
- filename: bootstrap/glibc.bst
  type: runtime

environment:
  PATH: "%{tools}/bin:/bin"
  CFLAGS: ''
  CXXFLAGS: ''
  LDFLAGS: ''

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
    - bootstrap_build_arch == "x86_64":
        CFLAGS_FOR_BUILD:  "%{build_flags_x86_64}"
        CXXFLAGS_FOR_BUILD: "%{build_flags_x86_64}"
        LDFLAGS_FOR_BUILD:  "%{ldflags_defaults}"
    - bootstrap_build_arch == "i686":
        CFLAGS_FOR_BUILD: "%{build_flags_i686}"
        CXXFLAGS_FOR_BUILD: "%{build_flags_i686}"
        LDFLAGS_FOR_BUILD:  "%{ldflags_defaults}"
    - bootstrap_build_arch == "arm":
        CFLAGS_FOR_BUILD:  "%{build_flags_arm}"
        CXXFLAGS_FOR_BUILD: "%{build_flags_arm}"
        LDFLAGS_FOR_BUILD:  "%{ldflags_defaults}"
    - bootstrap_build_arch == "aarch64":
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
    host_configargs='lt_cv_sys_lib_dlsearch_path_spec="/usr/lib/%{gcc_triplet}"' \
    target_configargs='lt_cv_sys_lib_dlsearch_path_spec="/usr/lib/%{gcc_triplet}"' \
    %{conf-extra}

  conf-link-args: |
    --enable-shared

config:
  install-commands:
    (>):
    - |
      ln -s gcc %{install-root}%{bindir}/cc

public:
  bst:
    split-rules:
      runtime:
        - '%{multiarch_libdir}/lib*.so.*'

      devel:
        (>):
        - '%{bindir}/*'
        - '%{libexecdir}'
        - '%{libexecdir}/**'
        - '%{datadir}/man'
        - '%{datadir}/man/**'
        - '%{datadir}/info'
        - '%{datadir}/info/**'
        - '%{datadir}/locale'
        - '%{datadir}/locale/**'
        - '%{indep-libdir}/gcc'
        - '%{indep-libdir}/gcc/**'
        - '%{libdir}/gcc'
        - '%{libdir}/gcc/**'
        - '%{multiarch_libdir}/lib*.a'
        - '%{multiarch_libdir}/liblsan.so'
        - '%{multiarch_libdir}/libstdc++.so'
        - '%{multiarch_libdir}/libgomp.so'
        - '%{multiarch_libdir}/libatomic.so'
        - '%{multiarch_libdir}/libubsan.so'
        - '%{multiarch_libdir}/libquadmath.so'
        - '%{multiarch_libdir}/libitm.so'
        - '%{multiarch_libdir}/libtsan.so'
        - '%{multiarch_libdir}/libmpxwrappers.so'
        - '%{multiarch_libdir}/libmpx.so'
        - '%{multiarch_libdir}/libcilkrts.so'
        - '%{multiarch_libdir}/libssp.so'
        - '%{multiarch_libdir}/libasan.so'
        - '%{multiarch_libdir}/libgfortran.so'
        - '%{multiarch_libdir}/libcc1.so'
        - '%{multiarch_libdir}/libgcc_s.so'

sources:
- kind: tar
  url: ftp_gnu_org:gcc/gcc-8.3.0/gcc-8.3.0.tar.xz
  ref: 64baadfe6cc0f4947a84cb12d7f0dfaf45bb58b7e92461639596c21e02d97d2c
- kind: tar
  url: ftp_gnu_org:gmp/gmp-6.1.2.tar.xz
  directory: gmp
  ref: 87b565e89a9a684fe4ebeeddb8399dce2599f9c9049854ca8c0dfbdea0e21912
- kind: tar
  url: ftp_gnu_org:mpfr/mpfr-4.0.2.tar.xz
  directory: mpfr
  ref: 1d3be708604eae0e42d578ba93b390c2a145f17743a744d8f3f8c2ad5855a38a
- kind: tar
  url: ftp_gnu_org:mpc/mpc-1.1.0.tar.gz
  directory: mpc
  ref: 6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e
- kind: patch
  path: patches/gcc/gcc-multiarch-os-dir.patch
