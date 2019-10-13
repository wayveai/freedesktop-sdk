kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-pip.bst

public:
  cpe:
    version-match: '(\d+)_(\d*)_(\d*)'

sources:
- kind: git_tag
  url: github:sqlalchemy/mako.git
  track: master
  ref: rel_1_1_0-0-gb6f3ae9ee9bfe3bebdb330b1c5adf9cfcd1be128
