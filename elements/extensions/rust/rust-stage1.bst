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
      url: tar_https:static.rust-lang.org/dist/rust-1.41.1-x86_64-unknown-linux-gnu.tar.xz
      ref: 14cd9014cf0d14a303e56e58cf9f89135d607590cd6b2201b38f25a4aa98f21a
  - target_arch == "i686":
      url: tar_https:static.rust-lang.org/dist/rust-1.41.1-i686-unknown-linux-gnu.tar.xz
      ref: e986045e8e56ae865b383aefcdef23ca926b0e11ffa785b90da1436d846bbea8
  - target_arch == "aarch64":
      url: tar_https:static.rust-lang.org/dist/rust-1.41.1-aarch64-unknown-linux-gnu.tar.xz
      ref: 190a875658d007c8089c22fe544721e8f195eceeb66cd78e7799cdf02d7f36d0
  - target_arch == "arm":
      url: tar_https:static.rust-lang.org/dist/rust-1.41.1-armv7-unknown-linux-gnueabihf.tar.xz
      ref: 201102dca7adab3b37658d75b2988b6fb9299749347da2bb4b55c7e7f9db8cae
  - target_arch == "powerpc64le":
      url: tar_https:static.rust-lang.org/dist/rust-1.41.1-powerpc64le-unknown-linux-gnu.tar.xz
      ref: 10a327cc2f480e40c6d1f3b5bf4966725ab712b52a41637f13468962cfc40647
