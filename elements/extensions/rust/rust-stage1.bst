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

variables:
# Disable debug handling in stage1 which is unnecessary and can cause
# failures during dwz optimizations.
  strip-binaries: "true"

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  (?):
  - target_arch == "x86_64":
      url: tar_https:static.rust-lang.org/dist/rust-1.42.0-x86_64-unknown-linux-gnu.tar.xz
      ref: 8c94fba97589f1548bbd0652ff337169a7e47b4cb08accd9973722fe830c27ff
  - target_arch == "i686":
      url: tar_https:static.rust-lang.org/dist/rust-1.42.0-i686-unknown-linux-gnu.tar.xz
      ref: a162c97398e5d42e47cd8c49b86ae8092a4f5d3bbc063895edf895c1c80de080
  - target_arch == "aarch64":
      url: tar_https:static.rust-lang.org/dist/rust-1.42.0-aarch64-unknown-linux-gnu.tar.xz
      ref: b30833fd98b3d2a5886e93473e100c32a319d741a305eda67ea5fc24c85e5f9a
  - target_arch == "arm":
      url: tar_https:static.rust-lang.org/dist/rust-1.42.0-armv7-unknown-linux-gnueabihf.tar.xz
      ref: 90e2deb1597940250b2c6e6fc8bd7f4d8a8893f7f2a7f709917885247ae1c084
  - target_arch == "powerpc64le":
      url: tar_https:static.rust-lang.org/dist/rust-1.42.0-powerpc64le-unknown-linux-gnu.tar.xz
      ref: e11bf7fc341ea0ba63e9c450aef996159c649ff0060580a641e9468445798637
