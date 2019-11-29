kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst
- components/python3-setuptools-scm.bst

sources:
- kind: git_tag
  url: github:jd/tenacity.git
  track: master

  ref: 6.0.0-0-g6cb9fe14554d05494b17f47db8e85b6183f8767f
