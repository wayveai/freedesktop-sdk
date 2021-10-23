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
  ref: pyparsing_3.0.0-0-g0352555d968f9952800f0728383de8e1f9526e1e
