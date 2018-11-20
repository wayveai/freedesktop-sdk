kind: autotools
description: GNU findutils

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

config:
  install-commands:
  - |
    cd "%{builddir}"
    %{cross-install}
  - |
    %{delete_libtool_files}

sources:
- kind: tar
  url: ftp_gnu_org:findutils/findutils-4.6.0.tar.gz
  ref: ded4c9f73731cd48fec3b6bdaccce896473b6d8e337e9612e16cf1431bb1169d
