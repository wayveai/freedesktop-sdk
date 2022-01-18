kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libtasn1.bst
- filename: components/libffi.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  builddir: ''
  conf-local: |
    --with-trust-paths=%{ca_path}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libp11-kit.so'

sources:
- kind: git_tag
  url: github:p11-glue/p11-kit.git
  track: master
  ref: 0.24.1-0-gdd0590d4e583f107e3e9fafe9ed754149da335d0
