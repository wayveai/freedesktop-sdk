kind: autotools
description: GNU C Library

depends:
- filename: libstdc++-stage1-build-deps.bst
  type: build
- filename: glibc.bst
  type: runtime

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
  url: ftp_gnu_org:gcc/gcc-8.2.0/gcc-8.2.0.tar.xz
  ref: 196c3c04ba2613f893283977e6011b2345d1cd1af9abeac58e916b1aab3e0080
