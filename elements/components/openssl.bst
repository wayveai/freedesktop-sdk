kind: autotools

build-depends:
- components/perl.bst

depends:
- bootstrap-import.bst

variables:
  openssl-target: linux-%{uname-arch}
  arch-conf: ''
  (?):
  - target_arch == "i686":
      openssl-target: linux-generic32
  - target_arch == "arm":
      openssl-target: linux-generic32
  - target_arch == "riscv64":
      openssl-target: linux-generic64
  - target_arch in ["x86_64", "aarch64", "ppc64le"]:
      arch-conf: enable-ec_nistp_64_gcc_128

config:
  configure-commands:
  - |
    if [ -n "%{builddir}" ]; then
      mkdir %{builddir}
      cd %{builddir}
        reldir=..
      else
        reldir=.
    fi

    ${reldir}/Configure %{arch-conf} \
      %{openssl-target} \
      --prefix=%{prefix} \
      --libdir=%{lib} \
      --openssldir=%{sysconfdir}/pki/tls \
      shared \
      threads

  install-commands:
    (>):
    - rm %{install-root}%{libdir}/lib*.a

    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/openssl"
      mv "%{install-root}%{includedir}/openssl/opensslconf.h" "%{install-root}%{includedir}/%{gcc_triplet}/openssl/"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/c_rehash'
        - '%{libdir}/libssl.so'
        - '%{libdir}/libcrypto.so'
        - '%{prefix}/ssl/misc/*'

  cpe:
    vendor: 'openssl'

sources:
- kind: git_tag
  url: github:openssl/openssl.git
  track: openssl-3.0
  ref: openssl-3.0.1-0-gb4e83ed7cd99c12d27e0e220c3afa1745a68f921
- kind: patch
  path: patches/openssl/0001-Use-SOURCE_DATE_EPOCH-for-copyright-year-if-defined.patch
