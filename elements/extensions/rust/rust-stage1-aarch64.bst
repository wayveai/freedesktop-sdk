kind: manual

(@): elements/extensions/rust/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.50.0-aarch64-unknown-linux-gnu.tar.xz
  ref: 4f38e4a5e9075d8938877ceed7687c99395a12aec2906b9e118bedb3014ad0ec
