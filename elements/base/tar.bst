kind: autotools

depends:
- filename: bootstrap-import.bst

environment:
  FORCE_UNSAFE_CONFIGURE: 1

sources:
- kind: tar
  url: ftp_gnu_org:tar/tar-1.32.tar.xz
  ref: d0d3ae07f103323be809bc3eac0dcc386d52c5262499fe05511ac4788af1fdd8
