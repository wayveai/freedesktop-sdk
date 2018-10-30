kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/perl.bst
- filename: base/buildsystem-autotools.bst
  type: build

variables:
  openssl-target: linux-%{arch}
  (?):
  - target_arch == "i686":
      openssl-target: linux-generic32
  - target_arch == "arm":
      openssl-target: linux-generic32

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

    ${reldir}/Configure %{openssl-target} \
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
        - '%{bindir}/*'
        - '%{libdir}/libssl.so'
        - '%{libdir}/libcrypto.so'
        - '%{prefix}/ssl/misc/*'

sources:
- kind: git_tag
  url: https://github.com/openssl/openssl
  track: master
  ref: OpenSSL_1_1_1-0-g1708e3e85b4a86bae26860aa5d2913fc8eff6086
