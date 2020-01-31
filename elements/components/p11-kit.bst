kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libtasn1.bst
- filename: components/libffi.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
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
  ref: 0.23.20-0-g762cdaa2cd5c5ec09cc844f9a6bdc551c7f6c8ed
