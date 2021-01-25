kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst

sources:
- kind: git_tag
  url: github:pyparsing/pyparsing.git
  track: master
  match:
  - 'pyparsing_*'
  exclude:
  - 'pyparsing_*a*'
  ref: pyparsing_3.0.0b2-0-g2f0f24daddb1abb22a612f03da6a5333c426d3cc
