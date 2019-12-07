kind: manual

depends:
- filename: bootstrap-import.bst
  type: build

config:
  install-commands:
  - |
    bash install.sh \
      --prefix="%{prefix}" \
      --destdir="%{install-root}" \
      --disable-ldconfig

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  (?):
  - target_arch == "x86_64":
      url: tar_https:static.rust-lang.org/dist/rust-1.33.0-x86_64-unknown-linux-gnu.tar.gz
      ref: 6623168b9ee9de79deb0d9274c577d741ea92003768660aca184e04fe774393f
  - target_arch == "i686":
      url: tar_https:static.rust-lang.org/dist/rust-1.33.0-i686-unknown-linux-gnu.tar.gz
      ref: c379203687d98e60623aa88c4df4992dd5a9548bc30674b9fc8e671a979e9f3a
  - target_arch == "aarch64":
      url: tar_https:static.rust-lang.org/dist/rust-1.33.0-aarch64-unknown-linux-gnu.tar.gz
      ref: a308044e4076b62f637313ea803fa0a8f340b0f1b53136856f2c43afcabe5387
  - target_arch == "arm":
      url: tar_https:static.rust-lang.org/dist/rust-1.33.0-armv7-unknown-linux-gnueabihf.tar.gz
      ref: f6f0ec0a98d922c4bfd79703bc9e9eef439ba347453f33608a87cd63c47e7245
