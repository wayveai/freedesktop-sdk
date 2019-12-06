kind: autotools

depends:
- filename: bootstrap-import.bst

variables:
  conf-local: |
    CXXFLAGS="$CXXFLAGS" \
    LDFLAGS="$LDFLAGS"

sources:
- kind: tar
  url: tar_https:download-mirror.savannah.gnu.org/releases/lzip/lzip-1.20.tar.gz
  ref: c93b81a5a7788ef5812423d311345ba5d3bd4f5ebf1f693911e3a13553c1290c
