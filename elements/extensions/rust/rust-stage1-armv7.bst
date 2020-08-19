kind: manual

(@): elements/extensions/rust/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.43.1-armv7-unknown-linux-gnueabihf.tar.xz
  ref: a0587b115d7dc01b8116ae4c395086fa2f45fefbb56b185ef7359139019d82ed
