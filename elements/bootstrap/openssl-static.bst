kind: autotools

depends:
- filename: bootstrap/openssl-static-build-deps.bst
  type: build

(@): elements/bootstrap/target.yml

variables:
  builddir: ''
  openssl-target: linux-%{arch}
  arch-conf: ''
  (?):
  - target_arch == "i686":
      openssl-target: linux-generic32
  - target_arch == "arm":
      openssl-target: linux-generic32
  - target_arch == "x86_64" or target_arch == "aarch64":
      arch-conf: enable-ec_nistp_64_gcc_128

  make-install: |
    make -j1 INSTALL_PREFIX="%{install-root}" install

environment:
  CC: '%{triplet}-gcc'
  AR: '%{triplet}-gcc-ar'
  RANLIB: '%{triplet}-gcc-ranlib'

config:
  configure-commands:
  - |
    ./Configure %{arch-conf} \
      %{openssl-target} \
      --prefix=%{prefix} \
      --libdir=%{lib} \
      no-krb5 \
      no-shared \
      threads \
      -fPIC \
      "-Wa,--noexecstack $CFLAGS $LDFLAGS"

sources:
- kind: tar
  url: https://www.openssl.org/source/openssl-1.0.2m.tar.gz
  ref: 8c6ff15ec6b319b50788f42c7abc2890c08ba5a1cdcd3810eb9092deada37b0f
