kind: autotools

depends:
- filename: bootstrap/openssl-build-deps.bst
  type: build

(@): elements/bootstrap/include/target.yml

environment:
  CC: '%{triplet}-gcc'
  AR: '%{triplet}-gcc-ar'
  RANLIB: '%{triplet}-gcc-ranlib'

variables:
  openssl-target: linux-%{arch}
  arch-conf: ''
  (?):
  - target_arch == "i686":
      openssl-target: linux-generic32
  - target_arch == "arm":
      openssl-target: linux-generic32
  - target_arch == "powerpc64le":
      openssl-target: linux-ppc64le
  - target_arch in ["x86_64", "aarch64", "powerpc64le"]:
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
    version: '1.1.1c'

sources:
- kind: git_tag
  url: github:openssl/openssl
  track: OpenSSL_1_1_1-stable
  ref: OpenSSL_1_1_1c-0-g97ace46e11dba4c4c2b7cb67140b6ec152cfaaf4
