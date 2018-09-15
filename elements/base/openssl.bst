kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/perl.bst
  - filename: base/autoconf.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/libtool.bst
    type: build

variables:
  builddir: ''
  openssl-target: linux-%{arch}
  (?):
    - target_arch == "i586":
        openssl-target: linux-generic32
    - target_arch == "arm":
        openssl-target: linux-generic32

config:
  configure-commands:
    - |
      ./Configure %{openssl-target} \
        --prefix=%{prefix} \
        --libdir=%{lib} \
        --openssldir=%{sysconfdir}/ssl \
        shared \
        threads

  install-commands:
    (>):
      - rm %{install-root}%{libdir}/lib*.a

      - |
        for man3 in "%{install-root}%{datadir}/man/man3"/*.3; do
          if [ -L "${man3}" ]; then
            ln -s "$(readlink "${man3}")ssl" "${man3}ssl"
            rm "${man3}"
          else
            mv "${man3}" "${man3}ssl"
          fi
        done

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{bindir}/*"
          - "%{libdir}/libssl.so"
          - "%{libdir}/libcrypto.so"
          - "%{prefix}/ssl/misc/*"

sources:
  - kind: git
    url: https://github.com/openssl/openssl
    track: master
    ref: 1708e3e85b4a86bae26860aa5d2913fc8eff6086  # OpenSSL_1_1_1
