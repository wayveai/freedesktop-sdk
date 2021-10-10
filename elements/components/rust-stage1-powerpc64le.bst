kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.54.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 2ef4f095d6dbc09021c5aec592c14ed5bf9facd0441de7c2d6eb65ce6fdd2d3d
