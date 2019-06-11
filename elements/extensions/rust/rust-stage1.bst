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

variables:
# Disable debug handling in stage1 which is unnecessary and can cause
# failures during dwz optimizations.
  strip-binaries: "true"

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  (?):
  - target_arch == "x86_64":
      url: https://static.rust-lang.org/dist/rust-1.34.2-x86_64-unknown-linux-gnu.tar.xz
      ref: 14545777668491286bfc1ce001c1fc0f118c6529fe98e7311ce0931bffa9e915
  - target_arch == "i686":
      url: https://static.rust-lang.org/dist/rust-1.34.2-i686-unknown-linux-gnu.tar.xz
      ref: df96118e91e1c57c1a2eda9f8de3653dd5f0de8971b4ba675adb39d7a7f89f78
  - target_arch == "aarch64":
      url: https://static.rust-lang.org/dist/rust-1.34.2-aarch64-unknown-linux-gnu.tar.xz
      ref: 39946b4f00839fb5713a7a18e9eede6db0082db45dbce1e58c4c2b35c64b5177
  - target_arch == "arm":
      url: https://static.rust-lang.org/dist/rust-1.34.2-armv7-unknown-linux-gnueabihf.tar.xz
      ref: 6dd2af2714845af693149ec6d5ab7c59311bfa40119a9f030580d26f61ae595a
