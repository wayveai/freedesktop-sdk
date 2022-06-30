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
  url: ftp_gnu_org:libidn/libidn2-2.3.2.tar.gz
  ref: 76940cd4e778e8093579a9d195b25fff5e936e9dc6242068528b437a76764f91
