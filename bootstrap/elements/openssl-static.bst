kind: autotools

depends:
  - filename: dependencies/base-sdk.bst
    type: build
  - filename: gnu-config.bst
    type: build
  - filename: linux-headers.bst
    type: build
  - filename: gcc-stage2.bst
    type: build
  - filename: binutils-stage1.bst
    type: build
  - filename: glibc.bst
    type: build
  - filename: cross-installation-links.bst
    type: build
  - filename: debugedit-host.bst
    type: build

variables:
  builddir: ''
  openssl-target: linux-%{target_arch}
  (?):
    - target_arch == "i686":
        openssl-target: linux-generic32
    - target_arch == "arm":
        openssl-target: linux-generic32

environment:
  CC: "%{triplet}-gcc"
  AR: "%{triplet}-gcc-ar"
  RANLIB: "%{triplet}-gcc-ranlib"

config:
  configure-commands:
    - |
      ./Configure %{openssl-target} \
        --prefix=%{prefix} \
        --libdir=%{lib} \
        no-krb5 \
        no-shared \
        threads \
        -fPIC

  install-commands:
    - |
      make -j1 INSTALL_PREFIX="%{install-root}%{sysroot}" install

sources:
  - kind: tar
    url: https://www.openssl.org/source/openssl-1.0.2m.tar.gz
    ref: 8c6ff15ec6b319b50788f42c7abc2890c08ba5a1cdcd3810eb9092deada37b0f
