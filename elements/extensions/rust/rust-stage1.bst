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
      url: https://static.rust-lang.org/dist/rust-1.31.1-x86_64-unknown-linux-gnu.tar.gz
      ref: a64685535d0c457f49a8712a096a5c21564cd66fd2f7da739487f028192ebe3c
  - target_arch == "i686":
      url: https://static.rust-lang.org/dist/rust-1.31.1-i686-unknown-linux-gnu.tar.gz
      ref: 1e77e5e8c745320faad9ce6f319a77b4a2e75d972eb68a195acd081ad910ab6d
  - target_arch == "aarch64":
      url: https://static.rust-lang.org/dist/rust-1.31.1-aarch64-unknown-linux-gnu.tar.gz
      ref: 29a7c6eb536fefd0ca459e48dfaea006aa8bff8a87aa82a9b7d483487033632a
  - target_arch == "arm":
      url: https://static.rust-lang.org/dist/rust-1.31.1-armv7-unknown-linux-gnueabihf.tar.gz
      ref: 11c717b781a7af5bdc829894139f8f45d4c12a061f7f9e39481f21426a04eb21
