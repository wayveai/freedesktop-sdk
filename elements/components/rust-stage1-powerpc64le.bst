kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.60.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 2fb5c3cba35f3c1815a24c4f0de1ae34ce6ccfb7fb63cb724070670e8bfceba2
