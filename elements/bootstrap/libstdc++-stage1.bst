kind: autotools
description: GNU C Library

depends:
- filename: bootstrap/libstdc++-stage1-build-deps.bst
  type: build
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

  lib: lib

  conf-local: |
    --enable-multiarch \
    --disable-nls \
    --disable-multilib

config:
  configure-commands:
  - |
    mkdir "%{builddir}"
    cd "%{builddir}"
    ../libstdc++-v3/%{configure}

sources:
- kind: tar
  url: ftp_gnu_org:gcc/gcc-9.1.0/gcc-9.1.0.tar.xz
  ref: 79a66834e96a6050d8fe78db2c3b32fb285b230b855d0a66288235bc04b327a0
