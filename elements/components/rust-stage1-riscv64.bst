kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.58.1-riscv64gc-unknown-linux-gnu.tar.xz
  ref: 488e30e926d1835c0140a01bff4d3fe6499be1e89e5c740b2ceace892ab4c2e6
