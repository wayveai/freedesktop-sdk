kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/python3.bst
  type: build

sources:
- kind: git_tag
  url: https://salsa.debian.org/iso-codes-team/iso-codes.git
  track: master
  ref: iso-codes-4.1-0-g164802d5fd8c7a8167816fd86a62b286680619f0
