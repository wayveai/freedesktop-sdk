kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.57.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: e9307d784affc3aec27e14a6d7924c31236d7a27a40b096232763d80068e34e6
