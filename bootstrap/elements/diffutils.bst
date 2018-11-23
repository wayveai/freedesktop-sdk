kind: autotools

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
  conf-local: |
    gl_cv_func_getopt_gnu=yes

config:
  install-commands:
  - |
    cd "%{builddir}"
    %{cross-install}

  - |
    %{delete_libtool_files}

sources:
- kind: tar
  url: ftp_gnu_org:diffutils/diffutils-3.6.tar.xz
  ref: d621e8bdd4b573918c8145f7ae61817d1be9deb4c8d2328a65cea8e11d783bd6
