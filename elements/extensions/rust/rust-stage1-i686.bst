kind: manual

(@): elements/extensions/rust/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.51.0-i686-unknown-linux-gnu.tar.xz
  ref: 98b8d3a889cc9542563dc842ea440530cc15a908f875ef62c6939a57bf13510d
