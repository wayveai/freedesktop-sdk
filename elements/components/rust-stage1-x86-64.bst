kind: manual

(@): elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.54.0-x86_64-unknown-linux-gnu.tar.xz
  ref: 9fb4a22b74120b81a4d896326b02d121d5f996b3288580c346ea55a52d8946a9
