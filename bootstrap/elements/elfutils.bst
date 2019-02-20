kind: autotools

depends:
- filename: elfutils-build-deps.bst
  type: build
- filename: zlib.bst
  type: runtime
- filename: bzip2.bst
  type: runtime

(@): target.yml

variables:
  conf-local: |
    --without-lzma

config:
  configure-commands:
    (<):
    - |
      autoreconf -f -v -i

public:
  bst:
    split-rules:
      runtime:
        - '%{libdir}/lib*.so.*'

      devel:
        (>):
        - '%{bindir}/**'
        - '%{libdir}/libasm.so'
        - '%{libdir}/libdw.so'
        - '%{libdir}/libelf.so'

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
- kind: patch
  path: patches/elfutils/no-rpath.patch
