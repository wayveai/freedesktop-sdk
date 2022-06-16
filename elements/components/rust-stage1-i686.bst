kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.60.0-i686-unknown-linux-gnu.tar.xz
  ref: 94567ff691b46ef3dff64f3866445a278a17b20639e62cdc4b6fcd7aed86cec8
