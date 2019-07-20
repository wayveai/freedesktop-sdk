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
  url: ftp_gnu_org:libidn/libidn2-2.2.0.tar.lz
  ref: 20c4861cb2fd3162664b1b25452fc3a9d70af2a0925f47b64ce12c83d3d9aca8
