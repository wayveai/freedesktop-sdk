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
      url: https://static.rust-lang.org/dist/rust-1.32.0-x86_64-unknown-linux-gnu.tar.gz
      ref: e024698320d76b74daf0e6e71be3681a1e7923122e3ebd03673fcac3ecc23810
  - target_arch == "i686":
      url: https://static.rust-lang.org/dist/rust-1.32.0-i686-unknown-linux-gnu.tar.gz
      ref: 4ce3a6a656669fa86606074b43fadeac7465ef48394249407e21106ed714c8db
  - target_arch == "aarch64":
      url: https://static.rust-lang.org/dist/rust-1.32.0-aarch64-unknown-linux-gnu.tar.gz
      ref: 60def40961728212da4b3a9767d5a2ddb748400e150a5f8a6d5aa0e1b8ba1cee
  - target_arch == "arm":
      url: https://static.rust-lang.org/dist/rust-1.32.0-armv7-unknown-linux-gnueabihf.tar.gz
      ref: d7b69f60689d2905d8d3c2829b0f1cd0f86265a255ff88ea0deb601aebac6428
