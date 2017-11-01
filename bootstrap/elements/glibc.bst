kind: myautotools
description: GNU C Library

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: dependencies/config.bst
  type: build
- filename: linux-headers.bst
  type: build
- filename: gcc-stage1.bst
  type: build
- filename: binutils-stage1.bst
  type: build

variables:
  debugdir: "%{cross-debugdir}"

config:
  configure-commands:
    - |
      mkdir "%{builddir}"
      cd "%{builddir}"
      echo slibdir=%{libdir} >configparms
      echo rootsbindir=%{sbindir} >>configparms
      ../configure \
      --host=%{triple} \
      --build=$(sh /config/config.guess) \
      --prefix=%{prefix} \
      --with-headers=%{sysroot}%{includedir}

  install-commands:
    - |
      cd "%{builddir}"
      %{cross-install}

sources:
- kind: tar
  url: http://ftp.gnu.org/gnu/glibc/glibc-2.26.tar.xz
  ref: e54e0a934cd2bc94429be79da5e9385898d2306b9eaf3c92d5a77af96190f6bd

