kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/xz.bst
  - filename: base/python3.bst
    type: build

variables:
  conf-local: |
    --with-python=%{bindir}/python3

config:
  install-commands:
    (>):
    - |
      %{delete_libtool_files}

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libxml2.so"

sources:
  - kind: tar
    url: ftp://xmlsoft.org/libxml2/libxml2-2.9.8.tar.gz
    ref: 0b74e51595654f958148759cfef0993114ddccccbb6f31aee018f3558e8e2732
  - kind: patch
    path: patches/libxml2-python-in-nodeWrap-deal-with-name-is-None-case.patch
  - kind: patch
    path: patches/libxml2-python3-unicode-errors.patch
