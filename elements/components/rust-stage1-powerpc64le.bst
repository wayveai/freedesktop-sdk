kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.58.1-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 45bf988d0337095a4d30bb237d552e3420b4381e208624f0d956e1caf6b90207
