kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
  type: build

sources:
- kind: git_tag
  url: debian_salsa:iso-codes-team/iso-codes.git
  track: master
  ref: iso-codes-4.4-0-g38edb926592954b87eb527124da0ec68d2a748f3
