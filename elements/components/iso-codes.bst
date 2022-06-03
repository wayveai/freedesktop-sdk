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
  ref: v4.10.0-0-g9a6c24ee40e737ab34273c1af13a8dabcae888dd
