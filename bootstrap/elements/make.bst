kind: myautotools
description: GNU make

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
  conf-args: |
    --build=$(sh /config/config.guess) \
    --host=%{triplet} \
    --prefix=%{prefix}

config:
  install-commands:
    - |
      cd "%{builddir}"
      %{cross-install}

sources:
- kind: tar
  url: http://ftp.gnu.org/gnu/make/make-4.2.1.tar.bz2
  ref: d6e262bf3601b42d2b1e4ef8310029e1dcf20083c5446b4b7aa67081fdffc589
