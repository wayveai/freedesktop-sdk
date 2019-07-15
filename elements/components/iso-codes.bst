kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
  type: build

sources:
- kind: git_tag
  url: https://salsa.debian.org/iso-codes-team/iso-codes.git
  track: master
  ref: iso-codes-4.3-0-g43398a317371e309361ce43072603863cb2f57e1
