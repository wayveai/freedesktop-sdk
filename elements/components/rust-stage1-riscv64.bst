kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.60.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: cc20c99079d69bd85e5ddb4990415bcc76293513e3b05e8a0ad1d2efa9b968a4
