kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.58.1-x86_64-unknown-linux-gnu.tar.xz
  ref: f71b077caf0becbd0af9fd22bc1fa31c4fdf7a21fe046da8a15a7bde1286da25
