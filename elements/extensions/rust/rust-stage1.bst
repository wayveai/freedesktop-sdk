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
      url: tar_https:static.rust-lang.org/dist/rust-1.39.0-x86_64-unknown-linux-gnu.tar.xz
      ref: 095874d294355e95236e07e3e82635d95b8872f751ad21c5d1d9b53ef443e536
  - target_arch == "i686":
      url: tar_https:static.rust-lang.org/dist/rust-1.39.0-i686-unknown-linux-gnu.tar.xz
      ref: 26b57f9c76ef9119e703a5b5acb7026963f18814cc167c2d8d6a562e05ad755c
  - target_arch == "aarch64":
      url: tar_https:static.rust-lang.org/dist/rust-1.39.0-aarch64-unknown-linux-gnu.tar.xz
      ref: a3f6943ad00bbf7131c8571b21f641082c8ac8298ee3a8bd5428e96743e31e05
  - target_arch == "arm":
      url: tar_https:static.rust-lang.org/dist/rust-1.39.0-armv7-unknown-linux-gnueabihf.tar.xz
      ref: d98a3cfaa427e7bba95a36cbe98cc2ded3ff5ee87242add1e0c393467c069756
  - target_arch == "powerpc64le":
      url: tar_https:static.rust-lang.org/dist/rust-1.39.0-powerpc64le-unknown-linux-gnu.tar.xz
      ref: b5e9abf89cb4d04f5e03aae77ef6a3cddc32821b9cd833f4c32a335fbb46cf76
