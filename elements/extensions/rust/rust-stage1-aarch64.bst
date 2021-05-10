kind: manual

(@): elements/extensions/rust/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.51.0-aarch64-unknown-linux-gnu.tar.xz
  ref: f0359cc4e83253eaa86e74724b457509932bbc4f3bb2311021fa43e5965d38eb
