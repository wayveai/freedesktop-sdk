kind: autotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/gdbm.bst
  - filename: base/sqlite.bst
  - filename: base/openssl.bst

variables:
  conf-local: |
    --with-plugindir="%{libdir}/sasl2" \
    --with-sqlite3 \
    --with-openssl \
    --disable-gssapi \
    --with-dblib=gdbm \
    --without-pam \
    --without-opie \
    --without-des

config:
  build-commands:
    # cyrus-sasl seems to use old version of automake and libtool that
    # seems to not properly compile in parallel when a .c files is
    # reused for several targets
    - |
      cd "%{builddir}"
      %{make} -j1 sasldir="%{libdir}/sasl2"

  install-commands:
    - |
      cd "%{builddir}"
      %{make-install} sasldir="%{libdir}/sasl2"

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/sasl2/lib*.la"
          - "%{libdir}/sasl2/lib*.so"
          - "%{libdir}/libsasl2.so"

sources:
  - kind: tar
    url: ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-2.1.26.tar.gz
    ref: 8fbc5136512b59bb793657f36fadda6359cae3b08f01fd16b3d406f1345b7bc3
