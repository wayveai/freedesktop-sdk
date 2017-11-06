kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build

environment:
  FORCE_UNSAFE_CONFIGURE: 1

sources:
  - kind: tar
    url: http://ftp.gnu.org/gnu/tar/tar-1.29.tar.xz
    ref: 402dcfd0022fd7a1f2c5611f5c61af1cd84910a760a44a688e18ddbff4e9f024
