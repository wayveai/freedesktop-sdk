kind: autotools

depends:
- filename: bootstrap/elfutils-build-deps.bst
  type: build
- filename: bootstrap/zlib.bst
  type: runtime
- filename: bootstrap/bzip2.bst
  type: runtime

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/elfutils-source.yml

variables:
  conf-local: >-
    utrace_cv_CC_m32=none
    --without-lzma
    --disable-debuginfod

config:
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
