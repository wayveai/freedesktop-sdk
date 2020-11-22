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
  ref: 3.3.3-0-g447da662b0c9548941a44a911e45c7cf6ad32861
