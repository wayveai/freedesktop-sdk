kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/m4.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgmp.so'

sources:
- kind: tar
  url: ftp_gnu_org:gmp/gmp-6.1.2.tar.xz
  ref: 87b565e89a9a684fe4ebeeddb8399dce2599f9c9049854ca8c0dfbdea0e21912
