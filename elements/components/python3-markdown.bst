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
  ref: 3.2.2-0-g7df1ed30d98cdc1316ec8da150644d957f1c6303
