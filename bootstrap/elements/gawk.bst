kind: autotools
description: GNU awk

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
  url: ftp_gnu_org:gawk/gawk-4.2.1.tar.xz
  ref: d1119785e746d46a8209d28b2de404a57f983aa48670f4e225531d3bdc175551
