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

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  (?):
  - target_arch == "x86_64":
      url: https://static.rust-lang.org/dist/rust-1.29.2-x86_64-unknown-linux-gnu.tar.gz
      ref: e9809825c546969a9609ff94b2793c9107d7d9bed67d557ed9969e673137e8d8
  - target_arch == "i686":
      url: https://static.rust-lang.org/dist/rust-1.29.2-i686-unknown-linux-gnu.tar.gz
      ref: fd67338c32348fc0cf09dd066975acc221e062fdc3b052912baef93b39a0b27e
  - target_arch == "aarch64":
      url: https://static.rust-lang.org/dist/rust-1.29.2-aarch64-unknown-linux-gnu.tar.gz
      ref: e11461015ca7106ef8ebf00859842bf4be518ee170226cb8eedaaa666946509f
  - target_arch == "arm":
      url: https://static.rust-lang.org/dist/rust-1.29.2-armv7-unknown-linux-gnueabihf.tar.gz
      ref: 943ee757d96be97baccb84b0c2a5da368f8f3adf082805b0f0323240e80975c0
