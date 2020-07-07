kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
  type: build

sources:
- kind: git_tag
  url: debian_salsa:iso-codes-team/iso-codes.git
  track: main
  ref: iso-codes-4.5.0-0-ga36019e5014bff251f83d522ddcfebaecf52afd3
