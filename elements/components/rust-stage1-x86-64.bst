kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.50.0-x86_64-unknown-linux-gnu.tar.xz
  ref: ebca47de5cbc225ec40573e67ceb1ad1ae9c97e6e7eca135d8fb535a5ee99168
