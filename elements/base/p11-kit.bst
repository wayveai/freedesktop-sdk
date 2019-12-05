kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libtasn1.bst
- filename: base/libffi.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gettext.bst
  type: build
- filename: base/which.bst
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
  ref: 0.23.15-0-g1ba80c67c492f25581ed97c8c31ffb5f20636d06
