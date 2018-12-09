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

(@): target.yml

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
- kind: git_tag
  url: https://github.com/madler/zlib.git
  track: master
  ref: v1.2.11-0-gcacf7f1d4e3d44d871b605da3b647f07d718623f
