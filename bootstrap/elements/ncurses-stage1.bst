kind: autotools
description: GNU ncurses stage 1

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: dependencies/config.bst
  type: build

variables:
  debugdir: "%{tools-debugdir}"

config:
  configure-commands:
    - |
      ./configure \
      --build=$(sh /config/config.guess) \
      --host=$(sh /config/config.guess) \
      --without-shared \
      --without-ada \
      --with-normal \
      --enable-widec \
      --prefix=%{tools}

sources:
- kind: tar
  url: http://ftp.gnu.org/gnu/ncurses/ncurses-6.0.tar.gz
  ref: f551c24b30ce8bfb6e96d9f59b42fbea30fa3a6123384172f9e7284bcf647260
