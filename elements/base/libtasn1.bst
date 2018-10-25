kind: autotools

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libtasn1.so'

sources:
- kind: tar
  url: ftp_gnu_org:libtasn1/libtasn1-4.13.tar.gz
  ref: 7e528e8c317ddd156230c4e31d082cd13e7ddeb7a54824be82632209550c8cca

