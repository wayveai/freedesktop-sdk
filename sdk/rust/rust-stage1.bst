kind: manual

depends:
  - filename: bootstrap-import.bst
    type: build

config:
  install-commands:
    - |
      bash install.sh \
        --prefix="%{prefix}" \
        --destdir="%{install-root}" \
        --disable-ldconfig

sources:
  - kind: tar
    (?):
      - target_arch == "x86_64":
          url: https://static.rust-lang.org/dist/rust-1.25.0-x86_64-unknown-linux-gnu.tar.gz
          ref: 06fb45fb871330a2d1b32a27badfe9085847fe824c189ddc5204acbe27664f5e
      - target_arch == "i586":
          url: https://static.rust-lang.org/dist/rust-1.25.0-i686-unknown-linux-gnu.tar.gz
          ref: 56c5ffdca29f8a3657d012d24644fd335405d7dac0b720b17f6321111f9c0e55
      - target_arch == "aarch64":
          url: https://static.rust-lang.org/dist/rust-1.25.0-aarch64-unknown-linux-gnu.tar.gz
          ref: 19a43451439e515a216d0a885d14203f9a92502ee958abf86bf7000a7d73d73d
      - target_arch == "arm":
          url: https://static.rust-lang.org/dist/rust-1.25.0-armv7-unknown-linux-gnueabihf.tar.gz
          ref: 3fc17d77c6d7d2053d0b376974b5d3d07994f71f419fd4eb03bfcb890186d7a5
