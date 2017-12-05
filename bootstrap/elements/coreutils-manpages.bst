kind: myautotools
description: GNU coreutils

depends:
- filename: dependencies/base-sdk.bst
  type: build

variables:
  conf-args: |
    --enable-install-program=hostname \
    --mandir=/coreutils-manpages

config:
  install-commands:
    - |
      cd "%{builddir}"
      make -j1 install-man DESTDIR="%{install-root}"

sources:
- kind: tar
  url: http://ftp.gnu.org/gnu/coreutils/coreutils-8.28.tar.xz
  ref: 1117b1a16039ddd84d51a9923948307cfa28c2cea03d1a2438742253df0a0c65
