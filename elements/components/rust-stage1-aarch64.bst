kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.57.0-aarch64-unknown-linux-gnu.tar.xz
  ref: 6ee1ea2daae52c44cb970cf2c740edca02d2234210ed45a79a58c4c87d45d71e
