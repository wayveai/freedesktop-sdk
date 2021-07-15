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
  url: ftp_gnu_org:libidn/libidn2-2.3.1.tar.gz
  ref: 8af684943836b8b53965d5f5b6714ef13c26c91eaa36ce7d242e3d21f5d40f2d
