kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.50.0-powerpc64le-unknown-linux-gnu.tar.xz
  ref: abe91e3106dc0f97f863391188461533f16476271fb843c8c1ea3b80621571e5
