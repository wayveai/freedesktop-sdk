kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libgcrypt.bst
- filename: base/libassuan.bst
- filename: base/libksba.bst
- filename: base/npth.bst
- filename: base/buildsystem-autotools.bst
  type: build

sources:
- kind: git_tag
  url: gnupg:gnupg.git
  track: master
  ref: gnupg-2.2.12-0-g7d8f4ee7cf56eda988acdc909160cbac71bff18a
