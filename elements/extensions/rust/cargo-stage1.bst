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
      url: https://static.rust-lang.org/dist/cargo-0.33.0-x86_64-unknown-linux-gnu.tar.gz
      ref: 9dd7f79a0ab882ed7c892731514a4aed6435f7bc8a20381a8346b471c8a14209
  - target_arch == "i686":
      url: https://static.rust-lang.org/dist/cargo-0.33.0-i686-unknown-linux-gnu.tar.gz
      ref: 163f46bd84ba6348dfe1ac3c10bc4730059f321791d2a7d4d4704fe8ddf8a755
  - target_arch == "aarch64":
      url: https://static.rust-lang.org/dist/cargo-0.33.0-aarch64-unknown-linux-gnu.tar.gz
      ref: 92438fb49b4f4c434826fc3d07368c9df114bac2294daf2a3109c63d5e86038a
  - target_arch == "arm":
      url: https://static.rust-lang.org/dist/cargo-0.33.0-armv7-unknown-linux-gnueabihf.tar.gz
      ref: d3fd97909f0c649e4c7d63bcdf368f54838400ed4dbd46862e66aca7b39aa85a
