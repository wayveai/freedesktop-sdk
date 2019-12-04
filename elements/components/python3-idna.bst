kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst

sources:
- kind: git_tag
  url: github:kjd/idna.git
  track: master
  ref: v2.8-0-g1cdf175e259b299be76f49c3ddc8794214f9931f
