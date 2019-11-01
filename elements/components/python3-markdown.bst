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
  ref: 3.1.1-0-g58b4d64db00ef50c090a9da4bc303c5e840c5c9f
