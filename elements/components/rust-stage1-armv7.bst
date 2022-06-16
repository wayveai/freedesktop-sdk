kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.60.0-armv7-unknown-linux-gnueabihf.tar.xz
  ref: f3c372bbb8927be77913dc7f3d1b4bacfdd0776008d617280dd8d046fe37846c
