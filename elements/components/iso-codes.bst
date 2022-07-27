kind: autotools

build-depends:
- components/gettext.bst
- components/python3.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_tag
  url: debian_salsa:iso-codes-team/iso-codes.git
  track: main
  ref: v4.11.0-0-g2651d7fe65582263c57385a852b0c6d8a49f6985
