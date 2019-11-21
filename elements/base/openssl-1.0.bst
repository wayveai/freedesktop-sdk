kind: autotools

description: OpenSSL 1.0, because some things can't build with 1.1

depends:
  # This element gets filtered in openssl-1.0-runtime-only.bst. Runtime deps
  # here would pass through the filter, and overlap with themselves.
- filename: bootstrap-import.bst
  type: build
- filename: base/perl.bst
  type: build
- filename: base/krb5.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build

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

config:
  configure-commands:
  - |
    ./Configure %{arch-conf} \
      %{openssl-target} \
      --prefix=%{prefix} \
      --libdir=%{lib} \
      --openssldir=%{sysconfdir}/ssl \
      enable-krb5 \
      --with-krb5-flavor=MIT \
      --with-krb5-dir=/usr \
      shared \
      threads \
      "-Wa,--noexecstack $CFLAGS $LDFLAGS"

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
        - '%{bindir}/*'
        - '%{libdir}/libssl.so'
        - '%{libdir}/libcrypto.so'
        - '%{sysconfdir}/ssl'
        - '%{sysconfdir}/ssl/**'

      runtime:
        (>):
        - '%{libdir}/engines/*.so'

sources:
- kind: git_tag
  url: github:openssl/openssl.git
  track: OpenSSL_1_0_2-stable
  ref: OpenSSL_1_0_2t-0-gcd7c7fc20b9feeb900632389401f514ac6b82f16
- kind: patch
    # Updates need to update this script if there are new symbols.
  path: patches/openssl/openssl-version-script.patch
