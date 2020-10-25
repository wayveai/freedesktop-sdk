kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-setuptools.bst
- filename: components/python3-pip.bst
  type: build
- filename: components/python3-wheel.bst
  type: build

sources:
- kind: git_tag
  url: github:Python-Markdown/markdown.git
  track: master
  ref: 3.3.2-0-g56b03b21f50d2b28b7ab87df7d8015e1f1b62184
