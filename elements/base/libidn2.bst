kind: autotools

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libidn2.so'

sources:
- kind: tar
  url: ftp_gnu_org:libidn/libidn2-2.0.5.tar.gz
  ref: 53f69170886f1fa6fa5b332439c7a77a7d22626a82ef17e2c1224858bb4ca2b8

