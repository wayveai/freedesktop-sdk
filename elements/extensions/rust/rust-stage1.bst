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
      url: https://static.rust-lang.org/dist/rust-1.35.0-x86_64-unknown-linux-gnu.tar.xz
      ref: 764c56a1855ebcd45b47ee0d47c8b36ae05074bbd425ad35f415b34180f57968
  - target_arch == "i686":
      url: https://static.rust-lang.org/dist/rust-1.35.0-i686-unknown-linux-gnu.tar.xz
      ref: 176dbd1acb00d85fead42cd46a201fa095b0fe52c54dd81e2e320471ef677a66
  - target_arch == "aarch64":
      url: https://static.rust-lang.org/dist/rust-1.35.0-aarch64-unknown-linux-gnu.tar.xz
      ref: 2e3b7988f631f382092e67e33b1a4e5bf34d67a2a33835d760d07c76e405dcde
  - target_arch == "arm":
      url: https://static.rust-lang.org/dist/rust-1.35.0-armv7-unknown-linux-gnueabihf.tar.xz
      ref: 7da797b60b79e4df8d01ad08bcefdd3df3138023535848c374f0e64507955b67
  - target_arch == "powerpc64le":
      url: https://static.rust-lang.org/dist/rust-1.35.0-powerpc64le-unknown-linux-gnu.tar.xz
      ref: 4cd0f4556e28aa43ccbb29f501200f2fd3877220340b840a69c806af5ff3ac33
