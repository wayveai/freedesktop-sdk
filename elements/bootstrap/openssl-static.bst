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
  url: tar_https:www.openssl.org/source/openssl-1.0.2r.tar.gz
  ref: ae51d08bba8a83958e894946f15303ff894d75c2b8bbd44a852b64e3fe11d0d6
