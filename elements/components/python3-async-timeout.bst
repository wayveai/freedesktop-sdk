kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

sources:
- kind: git_tag
  url: github:aio-libs/async-timeout.git
  track: master
  exclude:
  - '*a*'
  ref: v3.0.1-0-g992fd174a5282258228b74127914f4b8135bf30a
