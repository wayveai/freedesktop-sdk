kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.50.0-armv7-unknown-linux-gnueabihf.tar.xz
  ref: c1e347ddd0efb729a2ed6deb5d45027287cbb4624897ddc11cd08ae7e399d124
