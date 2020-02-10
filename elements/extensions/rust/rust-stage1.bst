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
      url: tar_https:static.rust-lang.org/dist/rust-1.40.0-x86_64-unknown-linux-gnu.tar.xz
      ref: 37492d6467bcea611b2c7388aed50b655524f81410e255142ef6cfb6cef1ec53
  - target_arch == "i686":
      url: tar_https:static.rust-lang.org/dist/rust-1.40.0-i686-unknown-linux-gnu.tar.xz
      ref: 82454e1b60b2bc24779d9c949cc0e1da43f3e423dbfc6b45b5afddf65829fc9d
  - target_arch == "aarch64":
      url: tar_https:static.rust-lang.org/dist/rust-1.40.0-aarch64-unknown-linux-gnu.tar.xz
      ref: 5817c8c3a919117ae6dac8e9b3039d4e614cc9bed8040bf64fcf2e683b8c6245
  - target_arch == "arm":
      url: tar_https:static.rust-lang.org/dist/rust-1.40.0-armv7-unknown-linux-gnueabihf.tar.xz
      ref: a5701ea0b7551e0a77d6e08fee4f4c871d448d4f7e82be0ee39a834918306e7e
  - target_arch == "powerpc64le":
      url: tar_https:static.rust-lang.org/dist/rust-1.40.0-powerpc64le-unknown-linux-gnu.tar.xz
      ref: 37d394ebc2c79ec585112d7ab2064d2a84bac3a841abb6a7244deed942398556
