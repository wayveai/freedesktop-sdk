kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.54.0-aarch64-unknown-linux-gnu.tar.xz
  ref: ee35b807d6cdedefed82f01e2beff448df2daa7ebd45e1f417d3706ad744b04a
