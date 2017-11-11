kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/perl.bst
    type: build

variables:
  builddir: ''
  openssl-target: linux-%{arch}
  (?):
    - target_arch == "i586":
        openssl-target: linux-x86
    - target_arch == "arm":
        openssl-target: linux-armv4

config:
  configure-commands:
    - |
      ./Configure %{openssl-target} \
        --prefix=%{prefix} \
        --libdir=%{lib} \
        shared \
        threads

  install-commands:
    (>):
      - |
        rm %{install-root}%{libdir}/lib*.a

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libssl.so"
        - "%{libdir}/libcrypto.so"

sources:
  - kind: tar
    url: https://www.openssl.org/source/openssl-1.1.0g.tar.gz
    ref: de4d501267da39310905cb6dc8c6121f7a2cad45a7707f76df828fe1b85073af
