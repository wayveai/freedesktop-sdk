kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.52.1-armv7-unknown-linux-gnueabihf.tar.xz
  ref: f9aca176aa1424d3bb90d35877d35afbb5a0db952db32ac37a3ed46c04e79528
