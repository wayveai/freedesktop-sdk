kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.47.0-i686-unknown-linux-gnu.tar.xz
  ref: fe4937a162e654b7d950ab26648eca5dc513ad704566b08c7169c56253872806
