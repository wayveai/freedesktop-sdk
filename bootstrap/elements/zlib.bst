kind: autotools
description: zlib

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
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
- filename: debugedit-host.bst
  type: build

variables:
  conf-args: |
    --prefix=%{prefix} \
    --sharedlibdir=%{libdir} \
    --libdir=%{libdir}

config:
  install-commands:
  - |
    cd "%{builddir}"
    %{cross-install}

  - |
    %{delete_libtool_files}

environment:
  CHOST: '%{triplet}'

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{sysroot}%{libdir}/libz.so'

sources:
- kind: tar
  url: https://zlib.net/zlib-1.2.11.tar.xz
  ref: 4ff941449631ace0d4d203e3483be9dbc9da454084111f97ea0a2114e19bf066
