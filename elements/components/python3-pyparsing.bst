kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst

sources:
- kind: git_tag
  url: github:pyparsing/pyparsing.git
  track: master
  ref: pyparsing_3.0.0a2-0-g0448be431e30369f6397c96c27cb7745a73a6871
