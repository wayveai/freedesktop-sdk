kind: manual

(@): elements/extensions/rust/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.47.0-aarch64-unknown-linux-gnu.tar.xz
  ref: e9d8c864482f12ab21fc0f351b006c2fb24733a39ea75c172b7a443d7a0e2a06
