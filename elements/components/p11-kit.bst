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
- kind: tar
  url: tar_https:github.com/p11-glue/p11-kit/releases/download/0.23.16.1/p11-kit-0.23.16.1.tar.gz
  ref: 4b34e92ae36fa493e0d94366c767f06d5f9951e3d8581d10fd935d738db1574d
