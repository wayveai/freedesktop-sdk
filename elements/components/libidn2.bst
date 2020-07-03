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
  url: ftp_gnu_org:libidn/libidn2-2.3.0.tar.lz
  ref: 6b222435016e2d9fce34af0b21057ebc85704c27e41a781466d9287f0627dc93
