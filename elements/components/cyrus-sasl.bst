kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/gdbm.bst
- filename: components/groff.bst
  type: build
- filename: components/sqlite.bst

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

  builddir: ""

config:
  build-commands:
  - |
    %{make} sasldir="%{libdir}/sasl2"

  install-commands:
  - |
    %{make-install} sasldir="%{libdir}/sasl2"

  - |
    %{delete_libtool_files}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/sasl2/lib*.la'
        - '%{libdir}/sasl2/lib*.so'
        - '%{libdir}/libsasl2.so'
  cpe:
    patches:
    - CVE-2019-19906
    ignored:
    - CVE-2020-8032

sources:
- kind: git_tag
  url: github:cyrusimap/cyrus-sasl.git
  track: master
  ref: cyrus-sasl-2.1.27-0-g0189425cc210555c36383293c468df5da73acc48
- kind: patch
  path: patches/cyrus-sasl/CVE-2019-19906.patch
