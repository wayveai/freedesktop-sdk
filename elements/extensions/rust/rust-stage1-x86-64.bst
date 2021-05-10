kind: manual

(@): elements/extensions/rust/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.51.0-x86_64-unknown-linux-gnu.tar.xz
  ref: 0f3bf3792f9d79d4dd12a7af2d7d1c43c23914690ab12f000030ac94c3e0d20f
