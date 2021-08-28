kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
  type: build

sources:
- kind: git_tag
  url: debian_salsa:iso-codes-team/iso-codes.git
  track: main
  ref: iso-codes-4.7.0-0-g59767ed869f3952575f7d0f639a290a4c4b315e5
