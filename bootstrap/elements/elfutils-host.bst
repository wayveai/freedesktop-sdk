kind: autotools

depends:
  - filename: dependencies/base-sdk.bst
    type: build
  - filename: gnu-config.bst
    type: build
  - filename: tools-lib-path.bst
    type: runtime

variables:
  prefix: "%{tools}"
  lib: "lib"
  build-triplet: "$(sh %{sysroot}%{datadir}/gnu-config/config.guess)"
  host-triplet: "$(sh %{sysroot}%{datadir}/gnu-config/config.guess)"

sources:
- kind: tar
  url: ftp://sourceware.org/pub/elfutils/0.173/elfutils-0.173.tar.bz2
  ref: b76d8c133f68dad46250f5c223482c8299d454a69430d9aa5c19123345a000ff
