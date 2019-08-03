kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-pip.bst

variables:
  pip: pip3
  fix-pyc-timestamps: "true"

public:
  cpe:
    version: '1.1.0'

sources:
- kind: git_tag
  url: github:sqlalchemy/mako.git
  track: master
  ref: rel_1_1_0-0-gb6f3ae9ee9bfe3bebdb330b1c5adf9cfcd1be128
