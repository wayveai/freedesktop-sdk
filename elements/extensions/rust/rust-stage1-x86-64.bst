kind: manual

(@): elements/extensions/rust/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.43.1-x86_64-unknown-linux-gnu.tar.xz
  ref: 59c4137b8b6a27c94a5b6c42e612e3d8d022e2aa12b0ac8ede662048b329fe94
