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
  ref: pyparsing_2.4.2-0-gbc531f1c137eb5e089c0d7c748449cd4dcdcb53e
