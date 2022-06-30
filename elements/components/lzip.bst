kind: autotools

depends:
- filename: bootstrap-import.bst

variables:
  conf-local: |
    CXXFLAGS="$CXXFLAGS" \
    LDFLAGS="$LDFLAGS"

sources:
- kind: tar
  url: tar_https:download-mirror.savannah.gnu.org/releases/lzip/lzip-1.23.tar.gz
  ref: 4792c047ddf15ef29d55ba8e68a1a21e0cb7692d87ecdf7204419864582f280d
