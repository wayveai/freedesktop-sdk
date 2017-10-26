kind: autotools
description: GNU awk

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
  debugdir: "%{cross-debugdir}"

config:
  configure-commands:
    - |
      ./configure \
      --build=$(sh /config/config.guess) \
      --host=%{triple} \
      --prefix=%{prefix}

  install-commands:
    - |
      %{cross-install}

sources:
- kind: tar
  url: http://ftp.gnu.org/gnu/gawk/gawk-4.2.0.tar.xz
  ref: d4f3cd31c001fd0ed52832d4fbfbdfeaa38ad541c182f80ff8fdf87324a6a9f2
