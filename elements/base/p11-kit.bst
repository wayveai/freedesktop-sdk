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
    --with-module-config=/etc/pkcs11/modules/ \
    --with-trust-paths=%{ca_path}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libp11-kit.so'

sources:
- kind: git
  url: https://github.com/p11-glue/p11-kit/
  ref: 3dd5810143e51dabdc58069e55b09a950349fa08    # 0.23.12
