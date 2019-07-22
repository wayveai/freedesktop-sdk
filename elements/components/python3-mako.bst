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
    version: '1.0.14'

sources:
- kind: git_tag
  url: github:sqlalchemy/mako.git
  track: master
  ref: rel_1_0_14-0-g0398aaf0f15cdbc70f0914eac130afe81257d76d
