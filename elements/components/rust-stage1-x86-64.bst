kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.57.0-x86_64-unknown-linux-gnu.tar.xz
  ref: 590772474cb5d24c3d85b8fb770246e4a6b7dd8b13a2ab1db2c50a3965a36e1a
