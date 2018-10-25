kind: autotools

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build
- filename: file.bst
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
  host-triplet: '%{triplet}'
  build-triplet: '%{guessed-triplet}'

config:
  install-commands:
  - |
    cd "%{builddir}"
    %{cross-install}

  - |
    %{delete_libtool_files}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{sysroot}%{libdir}/libpopt.so'

sources:
- kind: tar
  url: http://ftp.rpm.org/mirror/popt/popt-1.16.tar.gz
  ref: e728ed296fe9f069a0e005003c3d6b2dde3d9cad453422a10d6558616d304cc8
- kind: patch
  path: patches/popt-1.16-pkgconfig.patch
