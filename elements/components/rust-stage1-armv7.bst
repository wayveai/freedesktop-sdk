kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.47.0-armv7-unknown-linux-gnueabihf.tar.xz
  ref: 81f5e9fa2d0795fa5790e8bd9294cc32cd671805b8287d9d7c4c9e4ad7439191
