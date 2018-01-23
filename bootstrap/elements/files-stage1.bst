kind: autotools

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
  conf-args: |
    --build=$(sh /config/config.guess) \
    --host=$(sh /config/config.guess) \
    --prefix="%{tools}" \

sources:
  - kind: tar
    url: ftp://ftp.astron.com/pub/file/file-5.32.tar.gz
    ref: 8639dc4d1b21e232285cd483604afc4a6ee810710e00e579dbe9591681722b50
