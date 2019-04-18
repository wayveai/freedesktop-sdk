kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libtasn1.bst
- filename: components/libffi.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/gettext.bst
  type: build
- filename: components/which.bst
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
  url: github:p11-glue/p11-kit/
  ref: 0.23.15-0-g1ba80c67c492f25581ed97c8c31ffb5f20636d06
