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
- kind: git_tag
  url: savannah:gawk.git
  ref: gawk-4.2.1-0-gbd8a8ad0c258d2db31e420eec81932cf15bf9702
