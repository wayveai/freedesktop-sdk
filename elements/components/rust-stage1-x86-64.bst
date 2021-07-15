kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.52.1-x86_64-unknown-linux-gnu.tar.xz
  ref: 04df0b61eb1d5d9dd5793191121f5e7029d33a50f0fe2ae3ef3ec3d22899d855
