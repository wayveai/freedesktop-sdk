kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/python3.bst
- filename: base/libxslt.bst
- filename: base/buildsystem-autotools.bst
  type: build

variables:
  conf-local: PYTHON="/usr/bin/python3"

sources:
- kind: git_tag
  url: github:itstool/itstool.git
  track: master
  ref: 2.0.4-0-g890f35998ba7f86bdc58227142309b8ecc618c10
- kind: patch
  path: patches/itstool-Be-more-careful-about-libxml2-memory-management.patch
