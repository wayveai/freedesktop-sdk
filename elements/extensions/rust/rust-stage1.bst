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
      url: https://static.rust-lang.org/dist/rust-1.30.1-x86_64-unknown-linux-gnu.tar.gz
      ref: a01a493ed8946fc1c15f63e74fc53299b26ebf705938b4d04a388a746dfdbf9e
  - target_arch == "i686":
      url: https://static.rust-lang.org/dist/rust-1.30.1-i686-unknown-linux-gnu.tar.gz
      ref: c61655977fb16decf0ceb76043b9ae2190927aa9cc24f013d444384dcab99bbf
  - target_arch == "aarch64":
      url: https://static.rust-lang.org/dist/rust-1.30.1-aarch64-unknown-linux-gnu.tar.gz
      ref: 6d87d81561285abd6c1987e07b60b2d723936f037c4b46eedcc12e8566fd3874
  - target_arch == "arm":
      url: https://static.rust-lang.org/dist/rust-1.30.1-armv7-unknown-linux-gnueabihf.tar.gz
      ref: 9b3b6df02a2a92757e4993a7357fdd02e07b60101a748b4618e6ae1b90bc1b6b
