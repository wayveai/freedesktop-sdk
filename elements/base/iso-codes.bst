kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/python3.bst
  type: build

sources:
- kind: git
  url: https://salsa.debian.org/iso-codes-team/iso-codes.git
  ref: c1d5dd96b33cb815ebc21d2708bc045b1545249d    # v3.79
