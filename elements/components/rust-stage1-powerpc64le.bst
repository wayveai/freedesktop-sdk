kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.47.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: b0ebeec22a166d0899bae84dd741fe7a4c095aabdd29d7bb2a30b5767ee66221
