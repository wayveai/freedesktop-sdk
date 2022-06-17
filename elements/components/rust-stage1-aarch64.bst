kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.60.0-aarch64-unknown-linux-gnu.tar.xz
  ref: 5d18bc384273edbd8a4b6d18104685651fb42d5f07bdf518ef2ec3641269c95d
