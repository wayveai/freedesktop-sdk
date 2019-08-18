kind: autotools

depends:
- filename: bootstrap/elfutils-build-deps.bst
  type: build
- filename: bootstrap/zlib.bst
  type: runtime
- filename: bootstrap/bzip2.bst
  type: runtime

(@): elements/bootstrap/target.yml

variables:
  conf-local: |
    --without-lzma

config:
  configure-commands:
    (<):
    - |
      autoreconf -f -v -i

  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -exec rm {} ";"

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

sources:
- kind: tar
  url: sourceware_pub:elfutils/0.177/elfutils-0.177.tar.bz2
  ref: fa489deccbcae7d8c920f60d85906124c1989c591196d90e0fd668e3dc05042e
- kind: patch
  path: patches/elfutils/no-rpath.patch
