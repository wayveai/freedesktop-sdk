kind: autotools
description: GNU coreutils

sources:
- kind: tar
  url: http://ftp.gnu.org/gnu/coreutils/coreutils-8.28.tar.xz
  ref: 1117b1a16039ddd84d51a9923948307cfa28c2cea03d1a2438742253df0a0c65
- kind: patch
  path: elements/coreutils-no-man-deps.patch

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
- filename: coreutils-manpages.bst
  type: build

variables:
  debugdir: "%{cross-debugdir}"

config:
  configure-commands:
    - |
      ./configure \
      --build=$(sh /config/config.guess) \
      --host=%{triple} \
      --prefix=%{prefix} \
      --enable-install-program=hostname

  build-commands:
    - |
      cp /coreutils-manpages/man1/* man/

    - |
      %{make}

  install-commands:
    - |
      %{cross-install}
