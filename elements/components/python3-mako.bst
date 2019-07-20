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
    version: '1.0.13'

sources:
- kind: git_tag
  url: github:sqlalchemy/mako.git
  track: master
  ref: rel_1_0_13-0-g5b3a4a4aa981790935e60b99ef6f1ca07fdb302f
