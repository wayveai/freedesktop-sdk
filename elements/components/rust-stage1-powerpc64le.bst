kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.52.1-powerpc64le-unknown-linux-gnu.tar.xz
  ref: 794c2e0c7cb71e51601857286b070cd590ffd08c67fb1f34eeb9c95b0234fbbb
