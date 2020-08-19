kind: manual

(@): elements/extensions/rust/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.43.1-powerpc64le-unknown-linux-gnu.tar.xz
  ref: cbd84b34845ecddbd4cd1bda864b984d23cc0d8d12eeea8a07ffc42cad12d1c5
