kind: autotools

depends:
  - filename: dependencies/base-sdk.bst
    type: build
  - filename: dependencies/config.bst
    type: build
  - filename: linux-headers.bst
    type: build
  - filename: gcc-stage2.bst
    type: build
  - filename: binutils-stage1.bst
    type: build
  - filename: glibc.bst
    type: build
  - filename: cross-installation-links.bst
    type: build
  - filename: attr.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{sysroot}%{libdir}/libattr.so"
          - "%{sysroot}%{libdir}/libacl.so"
          - "%{sysroot}%{libexecdir}/libacl.so"

variables:
  builddir: ''
  conf-args: |
    --build=$(sh /config/config.guess) \
    --host=%{triplet} \
    --prefix=%{prefix} \
    --libdir=%{libdir}

config:
  install-commands:
    - |
      %{cross-install} install-dev install-lib
    - |
      %{delete_libtool_files}

sources:
  - kind: tar
    url: http://download.savannah.nongnu.org/releases/acl/acl-2.2.52.src.tar.gz
    ref: 179074bb0580c06c4b4137be4c5a92a701583277967acdb5546043c7874e0d23
