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

sources:
- kind: tar
  (?):
  - target_arch == "x86_64":
      url: https://static.rust-lang.org/dist/cargo-0.34.0-x86_64-unknown-linux-gnu.tar.gz
      ref: 4795ae5ca3bb8c7c83ca338676bb02b670efa1eb474e346284b629dc872bcce8
  - target_arch == "i686":
      url: https://static.rust-lang.org/dist/cargo-0.34.0-i686-unknown-linux-gnu.tar.gz
      ref: 651f8cbb2dd5634c5b8a38611ce6d6a48638fa3541f301f60c1e06837b8a6fca
  - target_arch == "aarch64":
      url: https://static.rust-lang.org/dist/cargo-0.34.0-aarch64-unknown-linux-gnu.tar.gz
      ref: 723b20633940c1a76b32f2f5ae103ff933a6277ac33fc930c6d4196e89246c55
  - target_arch == "arm":
      url: https://static.rust-lang.org/dist/cargo-0.34.0-armv7-unknown-linux-gnueabihf.tar.gz
      ref: 62c7e2082c5c651a6ce5b4b68def78f3c2470628d13befee3a9844c13c84f681
