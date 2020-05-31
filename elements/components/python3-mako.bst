kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-setuptools.bst
- filename: components/python3-pip.bst
  type: build

public:
  cpe:
    version-match: '(\d+)_(\d*)_(\d*)'

sources:
- kind: git_tag
  url: github:sqlalchemy/mako.git
  track: master
  ref: rel_1_1_3-0-g1f87991a8c42fd67904160e5dab511ca938871bd
