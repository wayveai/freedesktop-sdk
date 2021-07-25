kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.52.1-i686-unknown-linux-gnu.tar.xz
  ref: 7869459a1550166361a6509473ac9a03eb4019d74d32f79022860852b882fdb6
