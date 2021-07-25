kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.52.1-riscv64gc-unknown-linux-gnu.tar.xz
  ref: fd08490578e25a819cea9f90e7a0c78a150723fddbf5c9bffc09bf8259a09b5f
