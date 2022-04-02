kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.58.1-armv7-unknown-linux-gnueabihf.tar.xz
  ref: 5295b337779e0abfc43b8723b982a03df785cc1bc8cc327188337e89ae9bde17
