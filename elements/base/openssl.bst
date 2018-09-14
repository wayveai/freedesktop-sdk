kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/perl.bst
  - filename: base/krb5.bst
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

    - mkdir -p %{install-root}%{datadir}
    - mv %{install-root}%{sysconfdir}/ssl/man %{install-root}%{datadir}

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
  # Too many things depends on 1.0.
  - kind: git
    url: https://github.com/openssl/openssl
    track: master
    ref: e71ebf275da66dfd601c92e0e80a35114c32f6f8  # OpenSSL_1_0_2p
  - kind: patch
    # Updates need to update this script if there are new symbols.
    path: patches/openssl-version-script.patch
