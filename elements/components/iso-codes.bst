kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
  type: build

sources:
- kind: git_tag
  url: debian_salsa:iso-codes-team/iso-codes.git
  track: main
  ref: iso-codes-4.6.0-0-g3c012d266acaeda93d3e61ec11b8c18c1964fce1
