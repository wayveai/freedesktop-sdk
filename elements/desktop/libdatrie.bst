kind: autotools

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdatrie.so'

sources:
- kind: tar
  url: https://linux.thai.net/pub/thailinux/software/libthai/libdatrie-0.2.12.tar.xz
  ref: 452dcc4d3a96c01f80f7c291b42be11863cd1554ff78b93e110becce6e00b149
