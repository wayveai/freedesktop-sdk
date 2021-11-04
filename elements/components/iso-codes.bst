kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
  type: build

sources:
- kind: git_tag
  url: debian_salsa:iso-codes-team/iso-codes.git
  track: main
  ref: v4.8.0-0-g5d0a5515f26b3858e27939c8f9a732d8bd4271ab
