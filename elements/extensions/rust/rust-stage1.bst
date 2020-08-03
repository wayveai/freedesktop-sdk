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
      url: tar_https:static.rust-lang.org/dist/rust-1.43.1-x86_64-unknown-linux-gnu.tar.xz
      ref: 59c4137b8b6a27c94a5b6c42e612e3d8d022e2aa12b0ac8ede662048b329fe94
  - target_arch == "i686":
      url: tar_https:static.rust-lang.org/dist/rust-1.43.1-i686-unknown-linux-gnu.tar.xz
      ref: 171dc7cba06b7204604cdf3fac7669299e14a3e2d6de5a30c4be028f815ad1df
  - target_arch == "aarch64":
      url: tar_https:static.rust-lang.org/dist/rust-1.43.1-aarch64-unknown-linux-gnu.tar.xz
      ref: d8d8f6b881065c8cfc6b8df922907df838368fa60ce746910324f0ca1009163f
  - target_arch == "arm":
      url: tar_https:static.rust-lang.org/dist/rust-1.43.1-armv7-unknown-linux-gnueabihf.tar.xz
      ref: a0587b115d7dc01b8116ae4c395086fa2f45fefbb56b185ef7359139019d82ed
  - target_arch == "ppc64le":
      url: tar_https:static.rust-lang.org/dist/rust-1.43.1-powerpc64le-unknown-linux-gnu.tar.xz
      ref: cbd84b34845ecddbd4cd1bda864b984d23cc0d8d12eeea8a07ffc42cad12d1c5
