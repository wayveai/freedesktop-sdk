kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst
- components/python3-markupsafe.bst

public:
  cpe:
    version-match: '(\d+)_(\d*)_(\d*)'

sources:
- kind: git_tag
  url: github:sqlalchemy/mako.git
  track: main
  ref: rel_1_2_0-0-gc81402434e8a277b0134262ad485debcffa20280
