kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.51.0-riscv64gc-unknown-linux-gnu.tar.xz
  ref: 79c43b1796d2449a5c9ebf87b237236b6b7c37db3d8c6b62658f7ff12212e3e3
