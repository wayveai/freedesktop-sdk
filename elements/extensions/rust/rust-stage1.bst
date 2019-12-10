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
      url: tar_https:static.rust-lang.org/dist/rust-1.36.0-x86_64-unknown-linux-gnu.tar.xz
      ref: 7e8dfbbba493b7efa762daf9980406cd7266f7224e7895a9940b86ef7614f738
  - target_arch == "i686":
      url: tar_https:static.rust-lang.org/dist/rust-1.36.0-i686-unknown-linux-gnu.tar.xz
      ref: e3653a203b4ef3f8f4d661872664e0741755a36665ac77b4053c3f791b2be5d4
  - target_arch == "aarch64":
      url: tar_https:static.rust-lang.org/dist/rust-1.36.0-aarch64-unknown-linux-gnu.tar.xz
      ref: 009a55688042c8f64cab97a1019d2d4e2c5ebc932acaa9eadecbcb7cd8193183
  - target_arch == "arm":
      url: tar_https:static.rust-lang.org/dist/rust-1.36.0-armv7-unknown-linux-gnueabihf.tar.xz
      ref: d86790c837e6ef6f80cd477148342bef4fc93f0872715bf7bdd201f9dfc932da
  - target_arch == "powerpc64le":
      url: tar_https:static.rust-lang.org/dist/rust-1.36.0-powerpc64le-unknown-linux-gnu.tar.xz
      ref: abb43afccedbd902928397b302ff265114dce738a5bc3cc6fab2851bab2ab2a0
