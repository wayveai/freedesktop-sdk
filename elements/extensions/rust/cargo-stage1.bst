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
      url: https://static.rust-lang.org/dist/cargo-0.30.0-x86_64-unknown-linux-gnu.tar.gz
      ref: 32f210fd3142fda7825a06e95d1aa4b54035c2da435d8cf0dd03fad410c8002f
  - target_arch == "i686":
      url: https://static.rust-lang.org/dist/cargo-0.30.0-i686-unknown-linux-gnu.tar.gz
      ref: bc0f79a757601e0386e98bbbf870bf2a9f999d0085a9a2982d954833f8c519d5
  - target_arch == "aarch64":
      url: https://static.rust-lang.org/dist/cargo-0.30.0-aarch64-unknown-linux-gnu.tar.gz
      ref: c377ef2f41461b7a0186e0288dbd0936fe52f8eab725c03ed7eb84f2fd6152c2
  - target_arch == "arm":
      url: https://static.rust-lang.org/dist/cargo-0.30.0-armv7-unknown-linux-gnueabihf.tar.gz
      ref: 89a89d8e247aab6be86399c2b0ea3904f97cd5b7420191fdfd83e8e292ef7279

