kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.51.0-armv7-unknown-linux-gnueabihf.tar.xz
  ref: 8fc307490f2aafcde6ce3c2b9985b8fd76829947b8bf2c3d77bb7e25d817360b
