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
          url: https://static.rust-lang.org/dist/cargo-0.29.0-x86_64-unknown-linux-gnu.tar.gz
          ref: a5e7749767c47669ed9b6e32c6fb8eda6b0fe1c63ac73a6d4666b5c1352bad24
      - target_arch == "i686":
          url: https://static.rust-lang.org/dist/cargo-0.29.0-i686-unknown-linux-gnu.tar.gz
          ref: ec9ba3aa064719222bb59de4cf8f2ad061bb31288e7dd4e98b80215203aa5876
      - target_arch == "aarch64":
          url: https://static.rust-lang.org/dist/cargo-0.29.0-aarch64-unknown-linux-gnu.tar.gz
          ref: 44c5bc30f742de7c621f4bbe5faee0ef2b0486d4272834b11ae2c17f3b2cc38f
      - target_arch == "arm":
          url: https://static.rust-lang.org/dist/cargo-0.29.0-armv7-unknown-linux-gnueabihf.tar.gz
          ref: 78ee952a4e5e7052d945efa190f55fc1a4303f21c9846807fdc8b0857cf4f211

