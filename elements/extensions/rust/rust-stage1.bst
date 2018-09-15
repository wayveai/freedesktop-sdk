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
          url: https://static.rust-lang.org/dist/rust-1.28.0-x86_64-unknown-linux-gnu.tar.gz
          ref: 2a1390340db1d24a9498036884e6b2748e9b4b057fc5219694e298bdaa37b810
      - target_arch == "i686":
          url: https://static.rust-lang.org/dist/rust-1.28.0-i686-unknown-linux-gnu.tar.gz
          ref: de7cdb4e665e897ea9b10bf6fd545f900683296456d6a11d8510397bb330455f
      - target_arch == "aarch64":
          url: https://static.rust-lang.org/dist/rust-1.28.0-aarch64-unknown-linux-gnu.tar.gz
          ref: 9b6fbcee73070332c811c0ddff399fa31965bec62ef258656c0c90354f6231c1
      - target_arch == "arm":
          url: https://static.rust-lang.org/dist/rust-1.28.0-armv7-unknown-linux-gnueabihf.tar.gz
          ref: 346558d14050853b87049e5e1fbfae0bf0360a2f7c57433c6985b1a879c349a2