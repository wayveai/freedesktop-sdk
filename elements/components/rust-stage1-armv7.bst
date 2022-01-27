kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.57.0-armv7-unknown-linux-gnueabihf.tar.xz
  ref: 910a5be23ed2dfe82f50bd976393bf5d07e2b31510a6d080234d400412544228
