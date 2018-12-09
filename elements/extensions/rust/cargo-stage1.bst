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
      url: https://static.rust-lang.org/dist/cargo-0.31.0-x86_64-unknown-linux-gnu.tar.gz
      ref: bfbabba9a2c1717fe1ce68469ce2de7b4b94e44e6a165d50b77de7bf7515bdb6
  - target_arch == "i686":
      url: https://static.rust-lang.org/dist/cargo-0.31.0-i686-unknown-linux-gnu.tar.gz
      ref: 681caeb35516535896f555110923b5dbfd9d79b668a808d01c4cee88534c1ba4
  - target_arch == "aarch64":
      url: https://static.rust-lang.org/dist/cargo-0.31.0-aarch64-unknown-linux-gnu.tar.gz
      ref: fc7b102942e6fdb32b9cb077513bb50186834bef4c947ff0b011c552cd639f8e
  - target_arch == "arm":
      url: https://static.rust-lang.org/dist/cargo-0.31.0-armv7-unknown-linux-gnueabihf.tar.gz
      ref: 55dd38a6ca4528e18f6e546d4c4cdd12d3af6d3413ac68233cb64272fe93724e
