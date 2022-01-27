kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.57.0-i686-unknown-linux-gnu.tar.xz
  ref: 0fd516ab8d8c23850464adf535f648e07586c48444fd5fc3ee4a7f6b18521ba1
