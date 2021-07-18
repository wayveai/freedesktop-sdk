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
  ref: 0.24.0-0-g34826623f58399b24c21f1788e2cdaea34521b7b
