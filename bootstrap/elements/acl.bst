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
- filename: attr.bst
- filename: debugedit-host.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{sysroot}%{libdir}/libattr.so'
        - '%{sysroot}%{libdir}/libacl.so'
        - '%{sysroot}%{libexecdir}/libacl.so'

variables:
  build-triplet: '%{guessed-triplet}'
  host-triplet: '%{triplet}'

config:
  install-commands:
  - |
    cd %{builddir}
    %{cross-install}
  - |
    %{delete_libtool_files}

sources:
- kind: tar
  url: https://download.savannah.nongnu.org/releases/acl/acl-2.2.53.tar.gz
  ref: 06be9865c6f418d851ff4494e12406568353b891ffe1f596b34693c387af26c7
