kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.58.1-aarch64-unknown-linux-gnu.tar.xz
  ref: 0a80900aa160de4292b1174e25f183bd88f6c2fbb3056a59fcb4d658c70084cb
