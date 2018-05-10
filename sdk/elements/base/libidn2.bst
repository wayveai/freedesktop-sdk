kind: autotools

depends:
  - filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libidn2.so"

sources:
  - kind: tar
    url: http://ftp.gnu.org/gnu/libidn/libidn2-2.0.4.tar.gz
    ref: 644b6b03b285fb0ace02d241d59483d98bc462729d8bb3608d5cad5532f3d2f0

