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

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{sysroot}%{libdir}/libattr.so'

(@): target.yml

config:
  configure-commands:
    (<):
      - ./autogen.sh

  install-commands:
  - |
    cd %{builddir}
    %{cross-install}

# Man pages will be provided by Linux's man-pages
# sdk/elements/base/man-pages.bst
  - |
    rm -rf "%{install-root}%{sysroot}%{mandir}"

  - |
    %{delete_libtool_files}

sources:
- kind: git_tag
  url: savannah:attr.git
  ref: v2.4.48-0-gcfd8e6ef491a7a5ff900ba2ba3deff7d0bebb0a6
