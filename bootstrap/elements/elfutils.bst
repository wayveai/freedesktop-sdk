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
- filename: zlib.bst
  type: build
- filename: bzip2.bst
  type: build
- filename: libstdc++-stage1.bst
  type: build
- filename: cross-installation-links.bst
  type: build
- filename: debugedit-host.bst
  type: build

variables:
  build-triplet: '%{guessed-triplet}'
  host-triplet: '%{triplet}'
  conf-local: |
    --without-lzma

config:
  configure-commands:
    (<):
    - |
      autoreconf -f -v -i

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
        - '%{sysroot}%{bindir}/**'
        - '%{sysroot}%{libdir}/libasm.so'
        - '%{sysroot}%{libdir}/libdw.so'
        - '%{sysroot}%{libdir}/libelf.so'

sources:
- kind: tar
  url: sourceware_pub:elfutils/0.173/elfutils-0.173.tar.bz2
  ref: b76d8c133f68dad46250f5c223482c8299d454a69430d9aa5c19123345a000ff
