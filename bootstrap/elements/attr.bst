kind: myautotools

depends:
  - filename: dependencies/base-sdk.bst
    type: build
  - filename: dependencies/config.bst
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

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{sysroot}%{libdir}/libattr.so"

variables:
  builddir: ''
  conf-args: |
    --build=$(sh /config/config.guess) \
    --host=%{triplet} \
    --prefix=%{prefix} \
    --libdir=%{libdir}

config:
  install-commands:
    - |
      %{cross-install} install-dev install-lib

    # Man pages will be provided by Linux's man-pages
    # sdk/elements/base/man-pages.bst
    - |
      rm -rf "%{install-root}%{sysroot}%{mandir}"

sources:
  - kind: tar
    url: http://download.savannah.nongnu.org/releases/attr/attr-2.4.47.src.tar.gz
    ref: 25772f653ac5b2e3ceeb89df50e4688891e21f723c460636548971652af0a859
