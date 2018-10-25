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

variables:
  build-triplet: '%{guessed-triplet}'
  host-triplet: '%{triplet}'

config:
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
- kind: tar
  url: https://download.savannah.nongnu.org/releases/attr/attr-2.4.48.tar.gz
  ref: 5ead72b358ec709ed00bbf7a9eaef1654baad937c001c044fe8b74c57f5324e7
