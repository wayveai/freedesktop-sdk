kind: manual

(@): elements/extensions/rust/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.50.0-i686-unknown-linux-gnu.tar.xz
  ref: 69b68144726b78301688b5b52057440c63c420950e39eb48294567f50bc07e13
