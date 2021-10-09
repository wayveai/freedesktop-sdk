kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.54.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: bcb956dfca215e7c5f48b2f81873a94792d7603ada75a68d3f009ed41f02d89d
