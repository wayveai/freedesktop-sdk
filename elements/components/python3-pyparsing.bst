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
  ref: pyparsing_3.0.0b1-0-g2dd2e2bb70407eea91f18de2caea5ba4527eb7dc
