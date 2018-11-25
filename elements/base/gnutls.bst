kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/bison.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gettext.bst
  type: build
- filename: base/git-minimal.bst
  type: build
- filename: base/gperf.bst
  type: build
- filename: base/libtasn1.bst
- filename: base/libunistring.bst
- filename: base/libidn2.bst
- filename: base/nettle.bst
- filename: base/p11-kit.bst
- filename: base/patch.bst
  type: build

variables:
  conf-local: |
    --disable-doc \
    --with-default-trust-store-pkcs11="pkcs11:"

config:
  configure-commands:
    (<):
    - ./bootstrap --skip-po

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgnutls.so'
        - '%{libdir}/libgnutlsxx.so'

sources:
- kind: git_tag
  url: https://gitlab.com/gnutls/gnutls.git
  track: master
  ref: gnutls_3_6_4-0-g1c0b4baa6a88bfb79a30eb6fb7c579688d40034e
  submodules:
    gnulib:
      checkout: True
      url: savannah:gnulib
- kind: patch
  path: patches/gnutls-priority_set-do-not-override-the-version-afte.patch
