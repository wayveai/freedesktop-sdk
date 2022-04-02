kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.58.1-i686-unknown-linux-gnu.tar.xz
  ref: 110ca4967351d8535f3d39e24f40e2941c20346c5765d3530270e134ae50568e
