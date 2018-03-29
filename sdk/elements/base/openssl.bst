kind: autotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/perl.bst
    type: build
  - filename: base/krb5.bst

variables:
  builddir: ''
  openssl-target: linux-%{arch}
  (?):
    - target_arch == "i586":
        openssl-target: linux-generic32
    - target_arch == "arm":
        openssl-target: linux-armv4

config:
  configure-commands:
    - |
      ./Configure %{openssl-target} \
        --prefix=%{prefix} \
        --libdir=%{lib} \
        enable-krb5 \
        --with-krb5-flavor=MIT \
        --with-krb5-dir=/usr \
        shared \
        threads

  install-commands:
    - |
      make -j1 INSTALL_PREFIX="%{install-root}" install

    - |
      rm %{install-root}%{libdir}/lib*.a

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libssl.so"
          - "%{libdir}/libcrypto.so"

sources:
  # Too many things depends on 1.0.
  - kind: tar
    url: https://www.openssl.org/source/openssl-1.0.2m.tar.gz
    ref: 8c6ff15ec6b319b50788f42c7abc2890c08ba5a1cdcd3810eb9092deada37b0f
