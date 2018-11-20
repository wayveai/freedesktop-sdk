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

(@): target.yml

config:
  configure-commands:
    (<):
      - ./autogen.sh
  install-commands:
  - |
    cd %{builddir}
    %{cross-install}
  - |
    %{delete_libtool_files}

sources:
- kind: git_tag
  url: savannah:acl.git
  track: master
  ref: v2.2.53-0-g65ff056ac4c25141cc06e484bce040635e4abd3d
