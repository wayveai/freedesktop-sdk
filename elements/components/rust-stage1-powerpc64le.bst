kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.51.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: d21c95264e59828410afbeecf10b35ee8912fb21025c683a9abe7ff5603f9e90
