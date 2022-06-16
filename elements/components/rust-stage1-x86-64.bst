kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.60.0-x86_64-unknown-linux-gnu.tar.xz
  ref: 83c3fb8645379ec308192fa713df87044892639495722077e07aa779b310239e
