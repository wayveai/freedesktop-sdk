kind: manual

(@): elements/extensions/rust/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.43.1-aarch64-unknown-linux-gnu.tar.xz
  ref: d8d8f6b881065c8cfc6b8df922907df838368fa60ce746910324f0ca1009163f
