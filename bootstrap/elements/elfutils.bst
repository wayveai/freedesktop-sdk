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

(@): target.yml

variables:
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

  cpe:
    patches:
      - CVE-2019-7146
      - CVE-2019-7149
      - CVE-2019-7150

sources:
- kind: tar
  url: sourceware_pub:elfutils/0.175/elfutils-0.175.tar.bz2
  ref: f7ef925541ee32c6d15ae5cb27da5f119e01a5ccdbe9fe57bf836730d7b7a65b
- kind: patch
  path: patches/elfutils/CVE-2019-7146.patch
- kind: patch
  path: patches/elfutils/CVE-2019-7149.patch
- kind: patch
  path: patches/elfutils/CVE-2019-7150.patch
