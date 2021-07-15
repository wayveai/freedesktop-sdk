kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.52.1-aarch64-unknown-linux-gnu.tar.xz
  ref: 50f12da8c131edd0eab6d875c31194a461f67ac0a753b0f8805f5abbba88fea9
