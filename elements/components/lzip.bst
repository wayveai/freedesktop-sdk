kind: autotools

depends:
- filename: bootstrap-import.bst

variables:
  conf-local: |
    CXXFLAGS="$CXXFLAGS" \
    LDFLAGS="$LDFLAGS"

sources:
- kind: tar
  url: tar_https:download-mirror.savannah.gnu.org/releases/lzip/lzip-1.21.tar.gz
  ref: e48b5039d3164d670791f9c5dbaa832bf2df080cb1fbb4f33aa7b3300b670d8b
