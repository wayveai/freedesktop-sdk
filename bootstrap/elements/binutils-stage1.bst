kind: myautotools
description: GNU Binutils Stage 1

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: dependencies/config.bst
  type: build

variables:
  debugdir: "%{tools-debugdir}"
  conf-args: |
    --target=%{triple} \
    --build=$(sh /config/config.guess) \
    --host=$(sh /config/config.guess) \
    --prefix=%{tools} \
    --with-sysroot=%{sysroot} \
    --disable-nls \
    --disable-multilib \
    --disable-werror \
    --with-lib-path="%{libdir}:%{prefix}/lib"

sources:
- kind: tar
  url: http://ftp.gnu.org/gnu/binutils/binutils-2.29.tar.xz
  ref: 0b871e271c4c620444f8264f72143b4d224aa305306d85dd77ab8dce785b1e85
